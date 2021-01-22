module Gamayun::Admin
  class ResourcesController < BaseController
    def create
      klass.create(params[model_name])
    end

    private

    def klass
      model_name.capitalize.constantize
    end
  end
end
