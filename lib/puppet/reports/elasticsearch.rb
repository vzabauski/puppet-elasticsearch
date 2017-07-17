require 'rubygems'
require 'puppet'

begin
  require 'tire'
rescue LoadError => e
  Puppet.info "You need the `tire` gem to use the Elasticsearch report"
end

unless Puppet.version >= '2.6.5'
  fail "This report processor requires Puppet version 2.6.5 or later"
end

Puppet::Reports.register_report(:elasticsearch) do

  config_file = File.join(File.dirname(Puppet.settings[:config]), "elasticsearch.yaml")
  raise(Puppet::ParseError, "Elasticsearch report config file #{config_file} not readable") unless File.exist?(config_file)
  config = YAML.load_file(config_file)
  ENV['ELASTICSEARCH_URL'] = config[:elasticsearch_url]
  ELASTICSEARCH_INDEX = config[:elasticsearch_index]
  ELASTICSEARCH_TYPE = config[:elasticsearch_type]

  desc <<-DESC
Send notification of failed jobs to Elasticsearch
DESC

  def process
      Puppet.debug "Sending status for #{self.host} to Elasticsearch."
      details = Array.new

      self.logs.each do |log|
        details << log
      end
      hostname = self.host
      state = self.status
      runtime = Time.now.asctime
      Tire.index ELASTICSEARCH_INDEX do
        create

        store :host => hostname, :state => state, :date => runtime, :type => ELASTICSEARCH_TYPE, :tags => ['run'], :message => details

       refresh
     end

  end
end
