require 'active_record'
require 'active_support'

module JlsApi
  class Models
    include Singleton

    # Returns a list of objects as an ActiveRecord relation type.
    def index(model_class:)
      model_class.all
    end

    # Returns the created model if creation successful, else returns the models errors hash.
    def create(model_class:, attributes:)
      new_object = model_class.new(attributes)
      return new_object if new_object.save
      new_object.errors
    end

    # Returns the model if found, else `nil`.
    def show(model_class:, id:)
      model_class.find_by(id: id)
    end

    # Returns the updated model if update successful, `nil` if object not found, the models errors hash if update failed.
    def update(model_class:, id:, attributes:)
      object = model_class.find_by(id: id)
      return nil if object.nil?
      return object if object.update(attributes)
      object.errors
    end

    # Returns true if destroy was successful, `nil` if object not found and false if destroy failed.
    def destroy(model_class:, id:)
      object = model_class.find_by(id: id)
      return nil if object.nil?
      object.destroy
    end
  end
end
