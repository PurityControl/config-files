namespace :project do
  namespace :ruby do
    task :new, [:location]  do |t, args|
      mkdir_p(args.location)
      mkdir_p(File.join args.location, 'test')
      mkdir_p(File.join args.location, 'lib')
    end
  end
end
