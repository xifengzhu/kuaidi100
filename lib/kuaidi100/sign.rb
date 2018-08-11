module Kuaidi100
  module Sign

    def self.generate(params)
      param = params.dup
      string_sign_temp = (param.to_json + Kuaidi100.key + Kuaidi100.customer).to_s
      Digest::MD5.hexdigest(string_sign_temp).upcase
    end
  end
end
