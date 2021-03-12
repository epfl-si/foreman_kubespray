# frozen_string_literal: true

# Displays a "Kubespray" button after the host group action button
Deface::Override.new(
  :virtual_path => 'hostgroups/index',
  :name => 'kubespray_button',
  :insert_after => "erb[loud]:contains('action_buttons')",
  :text => "&nbsp;<%= action_buttons(display_link_if_authorized(_('Run Kubespray'), hash_for_play_kubespray_hostgroup_path(:id => hostgroup), :'data-no-turbolink' => true, :title => _('Run Kubespray on this host group'))) %>"
)
