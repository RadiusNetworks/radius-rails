require "radius/rails"

require_relative "types/validating_enum_type.rb"

module Radius
  module Rails
    class Railtie < ::Rails::Railtie
      config.app_generators do |g|
        g.templates.unshift File.expand_path('templates', __dir__)
      end

      initializer 'validating_enum.initialize' do
        ActiveSupport.on_load(:active_record) do
          ActiveRecord::Base.send :extend, ValidatingEnum
        end
      end
    end
  end
end
