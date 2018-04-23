require 'singleton'
require 'yaml'
require 'action_dispatch'

module ActionDispatch::Routing
  class Mapper
    def jls_api(version)
      JlsApi::Routes.instance.append_routes(version: version)
    end
  end
end

module JlsApi
  class Routes
    include Singleton

    attr_accessor :routes

    def load_routes(version:, base_directory:)
      directory = "#{base_directory}/#{version}/routes"
      default_routes_yaml_path = "#{directory}/default.yml"
      endpoint_routes_yaml_paths = Dir["#{directory}/*.yml"] - [default_routes_yaml_path]

      new_routes = {}

      default_routes = {}
      default_routes = YAML.load_file(default_routes_yaml_path) if File.exist?(default_routes_yaml_path)

      endpoint_routes_yaml_paths.each do |routes_yaml_path|
        combined_endpoint_routes = {}
        endpoint = File.basename(routes_yaml_path, ".yml")
        endpoint_routes = YAML.load_file(routes_yaml_path)

        combined_endpoint_routes['actions'] = endpoint_routes['actions'] || default_routes['actions'] || []

        combined_endpoint_routes['actions'].each do |action|
          combined_endpoint_routes[action] = default_routes[action] || {}
          combined_endpoint_routes[action] = combined_endpoint_routes[action].merge(endpoint_routes['all'] || {})
          combined_endpoint_routes[action] = combined_endpoint_routes[action].merge(endpoint_routes[action] || {})
        end

        new_routes[endpoint] = combined_endpoint_routes
      end

      new_routes
    end

    def append_routes(version:, base_directory: "app/api")
      new_routes = load_routes(version: version, base_directory: base_directory)

      Rails.application.routes.draw do
        namespace 'api' do
          namespace version do
            new_routes.keys.each do |endpoint|
              new_routes[endpoint]['actions'].each do |action|
                case action
                when 'index'
                  get endpoint, controller: endpoint, action: action
                when 'create'
                  post endpoint, controller: endpoint, action: action
                when 'show'
                  get "#{endpoint}/:id", controller: endpoint, action: action
                when 'update'
                  patch "#{endpoint}/:id", controller: endpoint, action: action
                  put "#{endpoint}/:id", controller: endpoint, action: action
                when 'destroy'
                  delete "#{endpoint}/:id", controller: endpoint, action: action
                else
                  raise "unknown action '#{action}' specified on endpoint '#{endpoint}'"
                end
              end
            end
          end
        end
      end

      @routes ||= {}
      @routes[version] = new_routes
    end
  end
end
