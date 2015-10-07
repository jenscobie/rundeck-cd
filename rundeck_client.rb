require 'rundeck-ruby-client'
require 'yaml'

class RundeckClient
  def initialize(output=STDOUT)
    @output = output
  end

  def get_info
    session = Rundeck::Session.new(ENV['SERVER_URL'], ENV['AUTH_TOKEN'])
    system_info = session.system_info

    @output.puts 'Rundeck version: ' + system_info['rundeck']['version']
    @output.puts 'API version: ' + system_info['rundeck']['apiversion']
  end

  def execute_job(environment)
    yaml = YAML.load(File.open('config.yml'))
    job_id = yaml[environment]['job_id']

    session = Rundeck::Session.new(ENV['SERVER_URL'], ENV['AUTH_TOKEN'])
    job = Rundeck::Job.find(session, job_id)

    @output.puts "Executing job: #{job_id}"
    execution = job.execute!({'env' => environment})
    log =  execution.wait_end 2, 30
    @output.puts "Job Completed: " + log[0]['completed']
  end
end
