#config/initializers/resque.rb

Resque.redis = Redis.new(:host => 'localhost', :port => 6379)
Resque.after_fork = Proc.new { ActiveRecord::Base.establish_connection }
#ENV['QUEUE'] = "*"
#Rake::Task["resque:work"].invoke