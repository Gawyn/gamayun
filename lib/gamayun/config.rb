require 'yaml'

module Gamayun
  module Config
    def config
      @config ||= YAML.load(File.read("#{Rails.root}/config/gamayun.yml"))
    end
  end
end
