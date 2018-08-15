module Kuaidi100
  module Sign

    def self.generate(params)
      param = params.dup
      string_sign_temp = (param.to_json + Kuaidi100.key + Kuaidi100.customer).to_s
      Digest::MD5.hexdigest(string_sign_temp).upcase
    end

    # MD5(param + salt) == sign
    def self.callback_verify?(params)
      params = params.dup
      sign = params.delete('sign')
      sign_string = params.delete('param') + Kuaidi100.salt
      sign == Digest::MD5.hexdigest(sign_string).upcase
    end
  end
end
