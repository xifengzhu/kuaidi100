require 'httparty'

module Kuaidi100
  module Service

    def query(express_no, express_code, options = {})

      params = {
        com: express_code,                        # 快递公司编码
        num: express_no,                          # 快递单号
        phone: options.delete(:mobiletelephone) || "", # 寄件人或收件人手机号（顺丰单号必填）
        from: options.delete(:from) || "",        # 出发地城市(可空)
        to: options.delete(:to) || "",            # 目的地城市（可空）
        resultv2: options.delete(:resultv2) || 0,   # 添加此字段表示开通行政区域解析功能
        # 用来generate签名的额外参数
        key: @key,
        customer: @customer
      }

      payload = {
        customer: @customer || Kuaidi100.customer,
        sign: Kuaidi100::Sign.generate(params),
        param: params.to_json
      }

      http_get('/poll/query.do', { query: payload })
    end

    def subscribe(express_no, express_code, options = {})

      # TODO: 支持 parameters 参数
      params = {
        company: express_code,
        number: express_no,
        from: options.delete(:from) || "",
        to: options.delete(:to) || "",
        key: @key || Kuaidi100.key,
        parameters: {
          "callbackurl": @callbackurl || Kuaidi100.callbackurl,
          "salt": @salt || Kuaidi100.salt,
          "mobiletelephone": options.delete(:mobiletelephone) || "", # 寄件人或收件人手机号（顺丰单号必填）
          "resultv2": "0",
          "autoCom": "0",
          "interCom": "0",
          "departureCountry": "",
          "departureCom": "",
          "destinationCountry": "",
          "destinationCom": ""
        }
      }

      payload = {
        schema: "json",
        param: params.to_json
      }

      http_get('/poll', { query: payload })
    end
  end
end
