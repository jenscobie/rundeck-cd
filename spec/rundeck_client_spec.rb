require 'spec_helper'
require_relative '../rundeck_client'

RSpec.describe RundeckClient do
  describe "#get_info" do
    before(:each) do
      @output = double('output').as_null_object
      @client = RundeckClient.new(@output)
    end

    it 'logs Rundeck version' do
      @output.should_receive(:puts).with('Rundeck version: 2.5.3')
      @client.get_info
    end

    it 'logs API version' do
      @output.should_receive(:puts).with('API version: 13')
      @client.get_info
    end
  end

  describe "#execute_job" do
    before(:each) do
      @output = double('output').as_null_object
      @client = RundeckClient.new(@output)
    end

    it 'logs execution start' do
      @output.should_receive(:puts).with('Executing job: 8f5e798c-716b-4dd4-a524-01ea441f24d8')
      @client.execute_job('development')
    end

    it 'logs execution status' do
      @output.should_receive(:puts).with('Execution status: succeeded')
      @client.execute_job('development')
    end
  end
end
