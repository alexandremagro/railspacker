require "railspacker/helper"

module Railspacker
  class Railtie < ::Rails::Railtie
    rake_tasks do
      load 'tasks/railspacker_tasks.rake'
    end

    initializer 'railspacker.helper' do
      ActiveSupport.on_load :action_controller do
        ActionController::Base.helper Railspacker::Helper
      end

      ActiveSupport.on_load :action_view do
        include Railspacker::Helper
      end
    end
  end
end
