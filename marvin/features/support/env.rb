require 'rest-assured'
require 'rest-client'
require 'erubis'
require 'stomp'

RestAssured::Server.address = 'http://localhost:4578'

class FakeMQ
  include Singleton
  attr_reader :client
  def initialize
    @client = Stomp::Client.new(:hosts => [ :host => 'localhost', :port => 61613 ])
  end
  def self.method_missing(*args)
    instance.client.obj_send(*args)
  end
end

module FixtureSupport
  def fixture(filename)
    fixtures_dir = File.dirname(__FILE__) + '/fixtures'
    File.read(File.join(fixtures_dir, filename))
  end
  def rescan_encoders
    queue = "/queue/marvin.scan_encoders"
    FakeMQ.publish queue, 'dummy'
  end
end

module DoubleSupport
  def create_double(path, template, context)
    default_opts = {
      profile_name: "Test",
      device_number: 1,
      device_id: 2,
      status: "running",
      live_id: 103,
      user_data: "blah",
      error_code: nil,
      switch_timestamp: nil,
      start_time: nil,
      complete_time: nil
    }
    file = fixture(template)
    xml = Erubis::Eruby.new(file).result(default_opts.merge!(context))
    RestAssured::Double.create(fullpath: path, content: xml)
  end
end

Before do
  RestClient.delete "#{RestAssured::Server.address}/doubles/all"
end

World(FixtureSupport)
World(DoubleSupport)