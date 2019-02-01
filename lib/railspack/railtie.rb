require "railspack/helper"

module Railspack
  class Railtie < ::Rails::Railtie
    rake_tasks do
      load 'tasks/railspack_tasks.rake'
    end

    initializer 'railspack.helper' do
      ActiveSupport.on_load :action_controller do
        ActionController::Base.helper Railspack::Helper
      end

      ActiveSupport.on_load :action_view do
        include Railspack::Helper
      end
    end
  end
end
