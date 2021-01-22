module Gamayun
  class Engine < ::Rails::Engine
    isolate_namespace Gamayun

    initializer "engine_name.assets.precompile" do |app|
      app.config.assets.precompile += %w( stylesheets/gamayun.css )
      app.config.assets.precompile += %w( gamayun/application.css )
    end

    def self.app_config
      filename = "#{Rails.root}/config/gamayun.yml"
      return @app_config if @app_config
      @app_config = File.exist?(filename) ? YAML.load(File.read(filename)) : Hash.new([])
      Gamayun::Engine.load_controllers!
      @app_config
    end

    def self.load_controllers!
      Engine.app_config['manageable_models'].each do |model_attrs|
        s = <<-CONTROLLERCLASS
          require_dependency "gamayun/application_controller"
          require_dependency "gamayun/admin/base_controller"
          require_dependency "gamayun/admin/resources_controller"

          class ::Gamayun::Admin::#{model_attrs['model'].capitalize.pluralize}Controller < Gamayun::Admin::ResourcesController
            before_action :require_role!

            private

            def model_name
              \"#{model_attrs['model']}\"
            end

            def require_role!
              # return false unless current_user && current_user.role == #{model_attrs['required_role']}
            end
          end
        CONTROLLERCLASS

        eval(s)
      end
    end
  end
end
