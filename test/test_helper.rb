require 'minitest/autorun'
require 'kuaidi100'
require 'webmock/minitest'

Kuaidi100.key = "kuaidi100-key"
Kuaidi100.customer = "kuaidi100-customer"
Kuaidi100.salt = "kuaidi100"
Kuaidi100.callbackurl = "http://self-domain.com"
