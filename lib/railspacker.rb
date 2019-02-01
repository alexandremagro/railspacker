require "railspacker/railtie"
require "railspacker/manifest/build"
require "railspacker/manifest/dev_server"

module Railspacker
  mattr_accessor :manifest
  mattr_accessor :before_assets_precompile_script, default: 'build'

  def self.run(name)
    system("yarn run #{name}")
  end
end
