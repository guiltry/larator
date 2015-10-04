module Larator
  class Generate < Thor

    desc "scaffold NAME", "Generate "
    method_option :controller_location, type: :string, default: "app/Http/Controllers"
    method_option :controller_namespace, type: :string, default: "App\\Http\\Controllers"
    method_option :model_location, type: :string, default: "app"
    method_option :model_namespace, type: :string, default: "App"
    method_option :view_location, type: :string, default: "resources/views"
    def scaffold(name)
      require "larator/generators/scaffold"
      Larator::Generators::Scaffold.start([name, options])
    end

    private
      def options
        original_options = super
        return original_options unless File.exists?(".larator.conf")
        defaults = ::YAML::load_file(".larator.conf") || {}
        Thor::CoreExt::HashWithIndifferentAccess.new(defaults.merge(original_options))
      end
  end
end

