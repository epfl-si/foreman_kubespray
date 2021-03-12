module ForemanKubespray
  class Engine < ::Rails::Engine
    isolate_namespace ForemanKubespray
    engine_name 'foreman_kubespray'

    config.autoload_paths += Dir["#{config.root}/app/overrides"]
  end
end
