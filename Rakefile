require 'rundeck'
require 'yaml'

Rundeck.endpoint = ENV['SERVER_URL']
Rundeck.api_token = ENV['AUTH_TOKEN']

task :default => :server_info

task :server_info do
  puts "Server URL: " + Rundeck.endpoint
  puts "Rundeck version: " + Rundeck.system_info.rundeck.version
  puts "API version: " + Rundeck.system_info.rundeck.apiversion
end

task :promote, [:environment] do |t, args|
  yaml = YAML.load(File.open('config.yml'))
  id = yaml[args[:environment]]['job_id']
  puts "Running job: #{id}"
  Rundeck.run_job(id)
end
