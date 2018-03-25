module JlsApi
  class InstallGenerator < Rails::Generators::Base
    def create_files_and_directories
      create_file "app/api/v1/models/.keep", ""
      create_file "app/api/v1/routes/default.yml", <<-CONTENT
actions:
  - index
  - create
  - show
  - update
  - destroy
index:
  paginatable: true
      CONTENT
    end
  end
end
