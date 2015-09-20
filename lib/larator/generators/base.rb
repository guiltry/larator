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

    end
  end
end

