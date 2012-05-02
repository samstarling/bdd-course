require 'rest-assured'
require 'rest-client'
require 'erubis'

RestAssured::Server.address = 'http://localhost:4578'

module FixtureSupport
  def fixture(filename)
    fixtures_dir = File.dirname(__FILE__) + '/fixtures'
    File.read(File.join(fixtures_dir, filename))
  end
end

module DoubleSupport
  def create_double(path, template, context)
    file = fixture(template)
    xml = Erubis::Eruby.new(file).result(context)
    RestAssured::Double.create(fullpath: path, content: xml)
  end
end

Before do
  RestClient.delete "#{RestAssured::Server.address}/doubles/all"
end

World(FixtureSupport)
World(DoubleSupport)