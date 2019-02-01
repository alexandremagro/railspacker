module Railspacker
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../../templates', __FILE__)

      def create_initializer_file
        copy_file 'package.json', './package.json'
        copy_file 'webpack.config.js', './webpack.config.js'
        copy_file 'config/initializers/railspacker.rb', 'config/initializers/railspacker.rb'
        empty_directory './app/webpack'

        append_to_file '.gitignore' do
          <<~TEXT

            # Ignore precompiled javascript packs
            /public/packs
            /public/packs-test
          TEXT
        end

        inject_into_class 'test/application_system_test_case.rb', 'ApplicationSystemTestCase' do
          "  Railspacker.run 'build-test'\n\n"
        end
      end
    end
  end
end
