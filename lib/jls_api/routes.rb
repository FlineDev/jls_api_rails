require 'singleton'
require 'yaml'
require 'action_dispatch'

module ActionDispatch::Routing
  class Mapper
    def jls_api(version)
      JlsApi::Routes.instance.load_routes(version: version)
    end
  end
end

module JlsApi
  class Routes
    include Singleton

    attr_accessor :routes

    def load_routes(version:, base_directory: "app/api")
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

      @routes ||= {}
      @routes[version] = new_routes
    end
  end
end
