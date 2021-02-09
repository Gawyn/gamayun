module Gamayun::Admin
  class ResourcesController < BaseController
    before_action :load_data

    def index
      @resources = klass.all
    end

    def new
      @resource = klass.new
    end

    def create
      klass.create(resource_params)
    end

    def edit
      @resource = klass.find(params[:id])
    end

    def update
      @resource = klass.find(params[:id])
      @resource.update(resource_params)

      redirect_to send("admin_#{model_name.pluralize}_path")
    end

    def destroy
      @resource.destroy
    end

    private

    def load_data
      @model_name = model_name
      @editable_attributes = editable_attributes
    end

    def editable_attributes
       r = Gamayun::Engine.app_config['manageable_models'].detect do |model|
         model['model'] == model_name
       end
       r['attributes']
    end

    def resource_params
      params.require(model_name.to_sym).permit(editable_attributes)
    end

    def pluralized_name
      model_name.pluralize
    end

    def klass
      model_name.capitalize.constantize
    end
  end
end
