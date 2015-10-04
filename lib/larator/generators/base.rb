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

      # --controller-location=App/Http/Controllers
      def controller_location
        opt['controller_location'] + '/'
      end

      # --controller-namespace=App\\Http\\Controllers
      def controller_namespace
        opt['controller_namespace']
      end

      # Model #

      # --model-location=App
      def model_location
        opt['model_location'] + '/'
      end

      # --model-namespace=App
      def model_namespace
        opt['model_namespace']
      end

      # View #

      # --model-location=App
      def view_location
        opt['view_location'] + '/'
      end

      ##########
      ## UTIL ##
      ##########

      def to_folder(name)
      end

      def to_file(name)
      end
    end
  end
end

