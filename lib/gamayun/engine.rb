module Gamayun
  class Engine < ::Rails::Engine
    isolate_namespace Gamayun

    def self.app_config
      @app_config ||= YAML.load(File.read("#{Rails.root}/config/gamayun.yml"))
    end
  end
end
