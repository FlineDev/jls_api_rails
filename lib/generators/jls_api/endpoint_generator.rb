module JlsApi
  class EndpointGenerator < Rails::Generators::NamedBase
    def create_files
      create_file "app/api/v1/models/#{file_name.singularize}.yml", <<-CONTENT
type: #{file_name.singularize.split('_').collect(&:capitalize).join}
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
    end
  end
end
