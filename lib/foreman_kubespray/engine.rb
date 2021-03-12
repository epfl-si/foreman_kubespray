module ForemanKubespray
  class Engine < ::Rails::Engine
    isolate_namespace ForemanKubespray
    engine_name 'foreman_kubespray'

    config.autoload_paths += Dir["#{config.root}/app/overrides"]

    config.to_prepare do
      ::HostgroupsController.include ForemanKubespray::Concerns::HostgroupsControllerExtensions
    end
  end
end
