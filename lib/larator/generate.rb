require 'yaml'

module Larator
  class Generate < Thor

    desc "scaffold NAME", "Generate "
    method_option :controller_location, type: :string
    method_option :controller_namespace, type: :string
    method_option :model_location, type: :string
    method_option :model_namespace, type: :string
    method_option :view_location, type: :string
    def scaffold(name)
      require "larator/generators/scaffold"
      Larator::Generators::Scaffold.start([name, options])
    end

    private
      def options
        original_options = super
        return original_options unless File.exists?(".larator.yml")
        defaults = ::YAML::load_file(".larator.yml") || {}
        Thor::CoreExt::HashWithIndifferentAccess.new(defaults.merge(original_options))
      end
  end
end

