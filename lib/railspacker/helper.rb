module Railspacker::Helper
  def pack_path(name)
    manifest = Railspacker.manifest.load

    if manifest.nil?
      raise "manifest.json not found."
    end

    if !manifest.key?(name)
      raise "Pack not found in manifest.json: #{name}"
    end
    
    [Railspacker.manifest.path_to, manifest[name]].join('/')
  end
end
