namespace :project do
  namespace :ruby do
    desc "creates a new ruby project with templates"
    task :new, [:location]  do |t, args|
      template_location = File.dirname(__FILE__) + '/templates/new_ruby_project'
      cp_r(template_location, args.location)
    end
  end
end
