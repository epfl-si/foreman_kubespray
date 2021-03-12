# frozen_string_literal: true

module ForemanKubespray
  module Concerns
    module HostgroupExtensions
      extend ActiveSupport::Concern

      def can_kubespray?
        parameters.include? "kubespray_cluster_name"
      end
    end
  end
end
