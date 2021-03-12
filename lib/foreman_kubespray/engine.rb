module ForemanKubespray
  class Engine < ::Rails::Engine
    isolate_namespace ForemanKubespray
    engine_name 'foreman_kubespray'

    config.autoload_paths += Dir["#{config.root}/app/overrides"]

    config.to_prepare do
      ::Hostgroup.include ForemanKubespray::Concerns::HostgroupExtensions
      ::HostgroupsController.include ForemanKubespray::Concerns::HostgroupsControllerExtensions
      ForemanKubespray::Engine.register_rex_feature  # Below
    end

    initializer 'foreman_kubespray.register_plugin', :before => :finisher_hook do
      require 'foreman_kubespray/register'
    end

    def self.register_rex_feature
      RemoteExecutionFeature.register(
        :kubespray_run,
        N_('Run Kubespray'),
        :description => N_("Runs Kubespray's main playbook on hosts in this host grouep"),
        :host_action_button => false
      )
    end
  end
end
