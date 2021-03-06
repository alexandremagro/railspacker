module Railspacker::Manifest
  class Build < Struct.new(:public_path, keyword_init: true)
    def load
      file = Rails.public_path.join(public_path).join('manifest.json')

      JSON.parse File.read(file)
    end
  end
end
