module Railspack::Helper
  def pack_path(name)
    manifest = Railspack.manifest.load

    if manifest.nil?
      raise "manifest.json not found."
    end

    if !manifest.key?(name)
      raise "Pack not found in manifest.json: #{name}"
    end
    
    [Railspack.manifest.path_to, manifest[name]].join('/')
  end
end
