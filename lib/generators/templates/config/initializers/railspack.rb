# `build` script will run before the `assets:precompile` task
# Railspack.before_assets_precompile_script = 'build'

Railspack.manifest = case Rails.env
when 'development'
  Railspack::Manifest::DevServer.new(url: 'http://localhost:3001')
when 'test'
  Railspack::Manifest::Build.new(public_path: 'packs-test')
when 'production'
  Railspack::Manifest::Build.new(public_path: 'packs')
end
