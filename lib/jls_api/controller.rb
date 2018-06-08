require 'action_controller'

module JlsApi
  class Controller < ActionController::Base
    ###
    ## Before Action Callbacks
    ###
    before_action :set_model_class

    def set_model_class
      resource_path = request.path.split('/')[3]
      model_name = resource_path.camelcase.singularize
      @model_class = model_name.constantize
    end

    ###
    ## Actions
    ###
    def index
      # TODO: not yet implemented
    end

    def create
      # TODO: not yet implemented
    end

    def show
      # TODO: not yet implemented
    end

    def update
      # TODO: not yet implemented
    end

    def destroy
      # TODO: not yet implemented
    end
  end
end
