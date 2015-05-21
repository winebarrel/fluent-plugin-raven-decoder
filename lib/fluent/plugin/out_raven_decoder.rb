class Fluent::RavenDecoderOutput < Fluent::Output
  Fluent::Plugin.register_output('raven_decoder', self)

  unless method_defined?(:log)
    define_method('log') { $log }
  end

  unless method_defined?(:router)
    define_method('router') { Fluent::Engine }
  end

  config_param :data_field, :string, :default => 'data'
  config_param :ignore_fields, :array, :default => ['modules', 'exception']
  config_param :prefix, :string

  def initialize
    super
    require 'base64'
    require 'zlib'
    require 'multi_json'
  end

  def start
    super
  end

  def shutdown
    super
  end

  def configure(conf)
    super
  end

  def emit(tag, es, chain)
    es.each do |time, record|
      data = record[@data_field]

      if data
        data = decode(data)
        tag = @prefix + '.' + tag
        router.emit(tag, time, data)
      else
        log.warn("Eaven data is not included: tag:#{tag} record:#{record.inspect}")
      end
    end

    chain.next
  rescue => e
    log.error(e.message + "\n" + e.backtrace.first)
  end

  private

  def decode(data)
    data = Base64.strict_decode64(data)
    data = Zlib::Inflate.inflate(data)
    data = MultiJson.load(data)

    @ignore_fields.each do |field|
      data.delete(field)
    end

    data
  end
end
