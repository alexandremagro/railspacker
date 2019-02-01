# `build` script will run before the `assets:precompile` task
# Railspacker.before_assets_precompile_script = 'build'

Railspacker.manifest = case Rails.env
when 'development'
  Railspacker::Manifest::DevServer.new(url: 'http://localhost:3001')
when 'test'
  Railspacker::Manifest::Build.new(public_path: 'packs-test')
when 'production'
  Railspacker::Manifest::Build.new(public_path: 'packs')
end
