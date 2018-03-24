module JlsApi
  class InstallGenerator < Rails::Generators::Base
    def create_keep_file
      create_file "app/api/.keep", ""
    end
  end
end
