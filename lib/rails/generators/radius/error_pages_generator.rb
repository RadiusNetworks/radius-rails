module Radius
  module Generators
    class ErrorPagesGenerator < ::Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)
      desc "Copy the error pages to public"
      def create_error_pages
        %w{ 401.html 404.html 422.html 500.html }.each do |file|
          template file, File.join('public', file)
        end
      end
    end
  end
end
