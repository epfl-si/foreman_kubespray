# frozen_string_literal: true

# Displays a "Kubespray" button after the host group action button
Deface::Override.new(
  :virtual_path => 'hostgroups/index',
  :name => 'kubespray_button',
  :insert_after => "erb[loud]:contains('action_buttons')",
  :text => "&nbsp;<%= action_buttons(link_to _('Run Kubespray'), 'javascript:void(0);', disabled: true, title: 'No Roles assigned') %>"
)
