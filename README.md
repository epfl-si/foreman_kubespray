# foreman_kubespray

## Configuration

Each Kubernetes cluster shall be represented in Foreman by one host group with no subgroups.

This plug-in doesn't use [Ansible
variables](https://theforeman.org/plugins/foreman_ansible/3.x/index.html#4.1.2ImportingVariables);
instead, all the host and host group configuration is via Foreman parameters.

### Host Group Parameters

<dl>
<dt><code>kubespray_cluster_name</code></dt>
<dd>The name of the cluster (mapped to the <code>cluster_name</code> <a href="https://github.com/kubernetes-sigs/kubespray/blob/master/docs/vars.md">Kubespray variable</a>). The foreman_kubespray plugin only operates on those host groups that have this parameter set.</dd>
<dt><code>kubespray_dns_domain</code></dt>
<dt><code>kubespray_enable_dual_stack_networks</code></dt>
<dd>Mapped to the corresponding <a href="https://github.com/kubernetes-sigs/kubespray/blob/master/docs/vars.md">Kubespray variables</a>, minus the <code>kubespray_</code> prefix (i.e. <code>dns_domain</code>, <code>enable_dual_stack_networks</code> )</dd>
<dt><code>kube_network_node_prefix</code></dt>
<dt><code>kube_network_node_prefix_ipv6</code></dt>
<dt><code>kube_pods_subnet</code></dt>
<dt><code>kube_pods_subnet_ipv6</code></dt>
<dt><code>kube_service_addresses</code></dt>
<dt><code>kube_service_addresses_ipv6</code></dt>
<dd>Those parameters correspond 1:1 with the <a href="https://github.com/kubernetes-sigs/kubespray/blob/master/docs/vars.md">like-named Kubespray variables</a></dd>
</dl>

### Host Parameters

<dl>
<dt><code>kubespray_etcd_member_name</code></dt>
<dd>The name of this node in the etcd cluster. Must be unique across all of time, i.e. you must change it upon reinstalling the node. (Using a numeric prefix or suffix is recommended.) Mapped to the <code>etcd_member_name</code> Ansible variable in Kubespray; also, hosts that have this parameter set are members of the <code>etcd_nodes</code> group.</dd>
<dt><code>kubespray_is_kube_node</code></dt>
<dt><code>kubespray_is_kube_master</code></dt>
<dt><code>kubespray_is_calico_rr</code></dt>
<dd>Boolean values, mapped to membership in Kubespray Ansible groups <code>kube_nodes</code>, <code>kube_masters</code> and <code>calico_rr_nodes</code> respectively
</dl>
