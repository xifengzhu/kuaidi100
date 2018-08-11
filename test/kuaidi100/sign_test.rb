require "test_helper.rb"

class SignTest < MiniTest::Test

  def setup
    @params = {
      "com": "shunfeng",
      "num": "765720722994",
      "from": "",
      "to": "",
      "resultv2": 0
    }
    @sign_md5 = "AEB6EE344DD2FF0C124DEFD642C8F16B"
  end

  def test_generate_sign
    assert_equal @sign_md5, Kuaidi100::Sign.generate(@params)
  end
end
