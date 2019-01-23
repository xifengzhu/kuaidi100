require 'httparty'

module Kuaidi100
  class Service
    include ::HTTParty

    base_uri 'https://poll.kuaidi100.com'.freeze

    def self.logistic_traces(express_no, express_code, options = {})

      params = {
        com: express_code,                        # 快递公司编码
        num: express_no,                          # 快递单号
        phone: options.delete(:mobiletelephone) || "", # 寄件人或收件人手机号（顺丰单号必填）
        from: options.delete(:from) || "",        # 出发地城市(可空)
        to: options.delete(:to) || "",            # 目的地城市（可空）
        resultv2: options.delete(:resultv2) || 0   # 添加此字段表示开通行政区域解析功能
      }

      payload = {
        customer: Kuaidi100.customer,
        sign: Kuaidi100::Sign.generate(params),
        param: params.to_json
      }

      response = self.get('/poll/query.do',
        query: payload,
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
      )
      JSON.parse(response.body)
    end

    def self.subscribe(express_no, express_code, options = {})

      # TODO: 支持 parameters 参数
      params = {
        company: express_code,
        number: express_no,
        from: options.delete(:from) || "",
        to: options.delete(:to) || "",
        key: Kuaidi100.key,
        parameters: {
          "callbackurl": Kuaidi100.callbackurl,
          "salt": Kuaidi100.salt,
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

      response = self.get('/poll',
        query: payload,
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
      )
      JSON.parse(response.body)
    end
  end
end
