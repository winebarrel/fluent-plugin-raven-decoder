require 'fluent/test'
require 'fluent/plugin/out_raven_decoder'

# Disable Test::Unit
module Test::Unit::RunCount; def run(*); end; end

RSpec.configure do |config|
  config.before(:all) do
    Fluent::Test.setup
  end
end

def run_driver(options = {})
  prefix = options[:prefix] || 'decoded'
  tag = options[:tag] || 'raven.error'

  fluentd_conf = <<-EOS
type raven_decoder
prefix #{prefix}
  EOS

  tag = options[:tag] || 'raven.error'
  driver = Fluent::Test::OutputTestDriver.new(Fluent::RavenDecoderOutput, tag).configure(fluentd_conf)

  driver.run do
    yield(driver)
  end
end
