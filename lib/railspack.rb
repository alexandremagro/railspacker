require "railspack/railtie"
require "railspack/manifest/build"
require "railspack/manifest/dev_server"

module Railspack
  mattr_accessor :manifest
  mattr_accessor :before_assets_precompile_script, default: 'build'

  def self.run(name)
    system("yarn run #{name}")
  end
end
