require "thor"
require "larator/generate"

module Larator
  class CLI < Thor
    include Thor::Actions

    def self.source_root
      File.dirname(__FILE__) + "/templates"
    end

    desc "generate larator config file", "Generate "
    def init
      template("init.tt", ".larator.yml")
    end

    desc "generate GENERATOR", "Generate "
    subcommand "generate", Larator::Generate
  end
end
