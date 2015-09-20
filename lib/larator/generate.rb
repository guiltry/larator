module Larator
  class Generate < Thor

    desc "scaffold NAME", "Generate "
    method_option :harry
    def scaffold(name)
      require "larator/generators/scaffold"
      Larator::Generators::Scaffold.start([name, options])
    end
  end
end

