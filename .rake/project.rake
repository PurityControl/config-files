namespace :project do
  namespace :ruby do
    desc "creates a new ruby project with templates"
    task :new, [:location]  do |t, args|
      template_location = File.dirname(__FILE__) + '/templates/new_ruby_project'
      cp_r(template_location, args.location)
    end
  end

  namespace :uchikomi do
    desc "creates a new uchikomi project"
    task :new, [:location,:language]  do |t, args|
      readme = args.location + '/README.org'
      template_location = File.dirname(__FILE__) + '/templates/uchi_komi_template'
      cp_r(template_location, args.location)
      `sed -i #{readme} -e "s/???????/#{args.language}/"`
    end
  end
end
