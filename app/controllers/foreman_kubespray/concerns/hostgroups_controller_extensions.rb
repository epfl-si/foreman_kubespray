module ForemanKubespray
  module Concerns
    module HostgroupsControllerExtensions
      extend ActiveSupport::Concern
      include ::ForemanAnsible::Concerns::JobInvocationHelper

      def play_kubespray
        find_resource
        check_hostgroup
        composer = job_composer(:kubespray_run, @hostgroup.hosts)
        composer.trigger
        redirect_to job_invocation_path(composer.job_invocation)
      rescue Foreman::Exception => e
        logger.error "error in HostgroupController#play_kubespray: #{e.class} #{e.message}\n#{e.backtrace.join("\n")}"
        error e.message
        redirect_to hostgroups_path
      end

      def action_permission
        case params[:action]
        when 'play_kubespray'
          :update
        else
          super
        end
      end
    end
  end
end
