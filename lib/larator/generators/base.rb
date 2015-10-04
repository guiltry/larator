require 'thor'
require 'thor/group'
require 'active_support/inflector'

module Larator
  module Generators
    class Base < Thor::Group
      include Thor::Actions

      argument :class_name
      argument :opt

      def self.source_root
        File.dirname(__FILE__) + "/templates/#{operation_name}/default"
      end

      def self.operation_name
        return self.name.split("::")[-1].downcase
      end

      protected

      # ex: UserPower
      def model_class_name
        class_name.classify
      end

      # ex: UserPower / UserPowers (On plural opt)
      def controller_class_name
        class_name.classify
      end

      # ex: user_power
      def singular_table_name
        class_name.underscore.singularize
      end

      # ex: user_powers
      def plular_table_name
        class_name.pluralize.underscore
      end

      #############
      ## OPTIONS ##
      #############

      # Controller #

      # --controller-location=app/Http/Controllers/
      def controller_location
        folder_format(opt['controller_location']) || "app/Http/Controllers/"
      end

      # --controller-namespace=App\\Http\\Controllers
      def controller_namespace
        namespace_format(opt['controller_namespace']) || "App\\Http\\Controllers"
      end

      # Model #

      # --model-location=app/
      def model_location
        folder_format(opt['model_location']) || "app/"
      end

      # --model-namespace=App
      def model_namespace
        namespace_format(opt['model_namespace']) || "App"
      end

      # View #

      # --model-location=App
      def view_location
        folder_format(opt['view_location']) || "resources/views/"
      end

      ##########
      ## UTIL ##
      ##########

      def folder_format(name)
        return if name == nil
        return name + '/'
      end

      def namespace_format(name)
        return if name == nil
        return name
      end
    end
  end
end

