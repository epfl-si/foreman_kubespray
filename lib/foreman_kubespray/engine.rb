module ForemanKubespray
  class Engine < ::Rails::Engine
    isolate_namespace ForemanKubespray
    engine_name 'foreman_kubespray'

    config.autoload_paths += Dir["#{config.root}/app/overrides"]

    config.to_prepare do
      ::Hostgroup.include ForemanKubespray::Concerns::HostgroupExtensions
      ::HostgroupsController.include ForemanKubespray::Concerns::HostgroupsControllerExtensions

    initializer 'foreman_kubespray.register_plugin', :before => :finisher_hook do
      require 'foreman_kubespray/register'
    end
    end
  end
end
