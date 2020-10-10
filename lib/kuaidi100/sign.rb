module Kuaidi100
  module Sign

    def self.generate(params)
      key = params.delete(:key) || Kuaidi100.key
      customer = params.delete(:customer) || Kuaidi100.customer
      string_sign_temp = (params.to_json + key + customer).to_s
      Digest::MD5.hexdigest(string_sign_temp).upcase
    end

    # MD5(param + salt) == sign
    def self.callback_verify?(params, salt)
      params = params.dup
      sign = params.delete('sign')
      sign_string = params.delete('param') + (salt || Kuaidi100.salt)
      sign == Digest::MD5.hexdigest(sign_string).upcase
    end
  end
end
