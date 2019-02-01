require 'net/http'

module Railspacker::Manifest
  class DevServer < Struct.new(:url, keyword_init: true)
    def load
      uri = URI("#{url}/manifest.json")

      JSON.parse Net::HTTP.get(uri)
    end

    def path_to
      url
    end
  end
end
