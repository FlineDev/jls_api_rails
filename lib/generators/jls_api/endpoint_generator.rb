module JlsApi
  class EndpointGenerator < Rails::Generators::NamedBase
    def create_files
      titlecased_file_name = file_name.singularize.split('_').collect(&:capitalize).join
      pluralized_titlecased_file_name = file_name.pluralize.split('_').collect(&:capitalize).join

      create_file "app/api/v1/models/#{file_name.singularize}.yml", <<-CONTENT
type: #{titlecased_file_name}
properties:
  readwrite:
    # propertyName: Type
  readonly:
    # propertyName: Type
  writeonly:
    # propertyName: Type
      CONTENT

      create_file "app/api/v1/routes/#{file_name.pluralize}.yml", <<-CONTENT
# actions:
#   - actionName
all:
  includable:
    # - relationName
index:
  filterable:
    # - attributePath
  sortable:
    # - attributePath
  # paginatable: booleanValue
      CONTENT

      create_file "app/api/v1/controllers/#{file_name.pluralize}_controller.rb", <<-CONTENT
require 'jls_api'

module Api
  module V1
    class #{pluralized_titlecased_file_name}Controller < JlsApi::Controller
      # no need to override
    end
  end
end
      CONTENT
    end
  end
end
