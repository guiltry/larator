require "larator/generators/base"

module Larator
  module Generators
    class Scaffold < Base

      def controller
        template("controller.tt", "app/Http/Controllers/#{controller_class_name}Controller.php")
      end

      def views
        template("views/index.tt", "resources/views/#{plular_table_name}/index.blade.php")
        template("views/create.tt", "resources/views/#{plular_table_name}/create.blade.php")
        template("views/show.tt", "resources/views/#{plular_table_name}/show.blade.php")
        template("views/edit.tt", "resources/views/#{plular_table_name}/edit.blade.php")
        template("views/_form.tt", "resources/views/#{plular_table_name}/_form.blade.php")
      end

      def request
        template("request.tt", "app/Http/Requests/#{model_class_name}Request.php")
      end

      def model
        template("model.tt", "app/#{model_class_name}.php")
      end

      def migration
        run("php artisan make:migration create_#{plular_table_name}_table --create=#{plular_table_name}")
      end

      def route
        append_to_file("app/Http/routes.php", "Route::resource('#{singular_table_name}', '#{controller_class_name}Controller');")
      end

      def factory
        template("factory.tt", "database/factories/#{model_class_name}Factory.php")
      end

      def test
        template("tests/phpunit/test.tt", "tests/#{model_class_name}Test.php")
      end
    end
  end
end
