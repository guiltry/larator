require "thor"
require "larator/generate"

module Larator
  class CLI < Thor
    desc "generate GENERATOR", "Generate "
    subcommand "generate", Larator::Generate
  end
end
