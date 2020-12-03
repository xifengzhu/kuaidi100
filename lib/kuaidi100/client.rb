module Kuaidi100
  class Client

    include ::HTTParty
    include Kuaidi100::Service

    base_uri 'https://poll.kuaidi100.com'.freeze

    attr_accessor :key, :customer, :callbackurl, :salt

    @@logger = ::Logger.new("./log/kuaidi100.log")

    HTTP_ERRORS = [
      EOFError,
      Errno::ECONNRESET,
      Errno::EINVAL,
      Net::HTTPBadResponse,
      Net::HTTPHeaderSyntaxError,
      Net::ProtocolError,
      Timeout::Error
    ]
    TIMEOUT = 5

    def initialize(key:, customer:, salt:, callbackurl:)
      @key = key
      @customer = customer
      @salt = salt
      @callbackurl = callbackurl
    end

    def http_get(path, options)
      options = options.dup.merge!({
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
          "Accept-Encoding" => "*"
        },
        timeout: TIMEOUT
      })

      uuid = SecureRandom.uuid

      @@logger.debug("request[#{uuid}] url: #{path}, options: #{options}")

      response = begin
                   resp = self.class.get(path, options)
                 rescue *HTTP_ERRORS
                   { "errmsg" => "连接超时" }.to_json
                 end

      @@logger.debug("response[#{uuid}]: #{response}")

      JSON.parse(response)

    end
  end
end
