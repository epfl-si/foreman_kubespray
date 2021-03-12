organizations = Organization.unscoped.all
locations = Location.unscoped.all
User.as_anonymous_admin do
  RemoteExecutionFeature.without_auditing do
    JobTemplate.without_auditing do
      Dir[File.join("#{ForemanKubespray::Engine.root}/app/views/foreman_kubespray/"\
                    'job_templates/**/*.erb')].each do |template|
        template = JobTemplate.import_raw!(File.read(template),
                                           :default => true,
                                           :lock => true)
        template.organizations = organizations if template.present?
        template.locations = locations if template.present?
      end
    end
  end
end
