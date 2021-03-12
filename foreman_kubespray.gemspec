# coding: utf-8

require File.expand_path('../lib/foreman_kubespray/version', __FILE__)
require 'date'

Gem::Specification.new do |s|
  s.name        = 'foreman_kubespray'
  s.version     = ForemanKubespray::VERSION
  s.licenses    = ['GPL-3.0', 'MIT']
  s.date        = Date.today.to_s
  s.authors     = ['EPFL IDEV-FSD']
  s.email       = ['idev-fsd@groupes.epfl.ch']
  s.homepage    = 'https://github.com/epfl-si/foreman_kubespray'
  s.description = 'Run Kubespray on host groups. Built on top of foreman_ansible'

  s.add_dependency 'deface'
  s.add_dependency 'foreman_ansible'

  s.files = `find * -name '.*' -prune -false -o -type f -print0`.split("\0").reject do |file|
    file.end_with? ".gemspec"
  end

end
