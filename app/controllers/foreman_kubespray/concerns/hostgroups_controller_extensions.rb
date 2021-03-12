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
        error e.message
        redirect_to hostgroups_path
      end
    end
  end
end
