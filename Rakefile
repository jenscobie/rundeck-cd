require 'rake'
require 'rundeck-ruby-client'
require 'yaml'
require_relative 'rundeck_client'

task :default => :info

desc 'View Rundeck server meta data'
task :info do
  client = RundeckClient.new($stdout)
  client.get_info
end

desc 'Execute the configured Rundeck job for (development|staging|production)'
task :execute_job, [:environment] do |t, args|
  client = RundeckClient.new($stdout)
  client.execute_job(args[:environment])
end

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.rspec_opts = '--format documentation'
  end
rescue LoadError
end
