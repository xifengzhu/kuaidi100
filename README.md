# Kuaidi100

A simple gem provides Kuaidi100 enterprise-edition APIs, includes query the express track and subscribe notification.

[![Build Status](https://travis-ci.org/xifengzhu/kuaidi100.svg?branch=master)](https://travis-ci.org/xifengzhu/kuaidi100)

## Installation

Add this line to your Gemfile:

```ruby
gem 'kuaidi100', :github => 'xifengzhu/kuaidi100'
```

And then execute:

```sh
$ bundle
```

## Usage

### Config

Create `config/initializers/kuaidi100.rb` and put following configurations into it.

```ruby
# required
Kuaidi100.key = 'key'
Kuaidi100.customer = 'customer_id'
Kuaidi100.salt = "salt"
Kuaidi100.callbackurl = "http://${domain}.com"
```

### APIs

Kuaidi100 gem supports express track query and subscribe push from kuaidi100.

** Get official document from kuaidi100 for detailed request params and return fields**

Common Kuaidi100 Express Code：

```
"tiantian"=>"天天",
"shentong"=>"申通",
"yuantong"=>"圆通",
"shunfeng"=>"顺丰",
"debangwuliu"=>"德邦",
"yunda"=>"韵达"
```

#### Express Track Query

```ruby
result = Kuaidi100::Service.logistic_traces("765698489802", "shunfeng", {mobiletelephone: '132xxxxxxxx'})
# => {
#      "message"=>"ok",
#      "nu"=>"765720722994",
#      "ischeck"=>"0",
#      "condition"=>"00",
#      "com"=>"shunfeng",
#      "status"=>"200",
#      "state"=>"0",
#      "data"=>[
#         {
#            "time"=>"2018-08-11 20:19:08", "ftime"=>"2018-08-11 20:19:08", "context"=>"[广州市]快件到达 【广州番禺集散中心】"
#          }, {
#            "time"=>"2018-08-11 19:49:08", "ftime"=>"2018-08-11 19:49:08", "context"=>"[广州市]快件已发车"
#          }, {
#            "time"=>"2018-08-11 19:13:55", "ftime"=>"2018-08-11 19:13:55", "context"=>"[广州市]快件在【广州番禺石北营业点】已装车,准备发往 【广州番禺集散中心】"
#          },{
#            "time"=>"2018-08-11 18:06:00", "ftime"=>"2018-08-11 18:06:00", "context"=>"[广州市]顺丰速运 已收取快件"
#          }
#        ]
#      }
#    }
```
注： mobiletelephone 顺丰快递为必填参数

#### Subscribe Push from Kuaidi100

```ruby
result = Kuaidi100::Service.subscribe("765698489802", "shunfeng", "shunfeng", {mobiletelephone: '132xxxxxxxx'})
# => {
#       "result":true,
#       "returnCode":"200",
#       "message":"提交成功"
#    }
```
注： mobiletelephone 顺丰快递为必填参数

#### Notify Process

A simple example of processing notify.

```ruby
# config/routes.rb
post "notify" => "express#notify"

# app/controllers/express_controller.rb

def notify
  if Kuaidi100::Sign.callback_verify?(params)

    # find your logistic and update it

    render json: { result: true, returnCode: "200", message: "成功" }
  else
    render json: { result: false, returnCode: "500", message: "签名失败" }, status: 500
  end
end
```

## Contributing

Bug report or pull request are welcome.

### Make a pull request

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

Please write unit test with your code if necessary.

## License

This project rocks and uses MIT-LICENSE.
