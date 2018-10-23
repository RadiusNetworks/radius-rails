require "radius/rails"

module Radius
  module Rails
    class Railtie < ::Rails::Railtie
      config.app_generators do |g|
        g.templates.unshift File.expand_path('templates', __dir__)
      end
    end
  end
end
