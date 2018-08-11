require "test_helper.rb"

class ServiceTest < MiniTest::Test

  def setup
    @express_no = "765698489802"
    @express_code = "shunfeng"
  end

  def test_logistic_traces
    response_body = "{\"message\":\"ok\",\"nu\":\"765698489802\",\"ischeck\":\"1\",\"condition\":\"F00\",\"com\":\"shunfeng\",\"status\":\"200\",\"state\":\"3\",\"data\":[{\"time\":\"2018-08-08 09:05:22\",\"ftime\":\"2018-08-08 09:05:22\",\"context\":\"[广州市]已签收,感谢使用顺丰,期待再次为您服务\"},{\"time\":\"2018-08-08 08:12:16\",\"ftime\":\"2018-08-08 08:12:16\",\"context\":\"[广州市]快件交给邓均勤，正在派送途中（联系电话：18617344882）\"},{\"time\":\"2018-08-07 20:16:10\",\"ftime\":\"2018-08-07 20:16:10\",\"context\":\"[广州市]快件到达 【广州海珠北山村营业部】\"},{\"time\":\"2018-08-07 19:48:02\",\"ftime\":\"2018-08-07 19:48:02\",\"context\":\"[广州市]快件已发车\"},{\"time\":\"2018-08-07 19:07:01\",\"ftime\":\"2018-08-07 19:07:01\",\"context\":\"[广州市]快件在【广州番禺集散中心】已装车,准备发往 【广州海珠北山村营业部】\"},{\"time\":\"2018-08-07 18:27:09\",\"ftime\":\"2018-08-07 18:27:09\",\"context\":\"[广州市]快件到达 【广州番禺集散中心】\"},{\"time\":\"2018-08-07 17:55:38\",\"ftime\":\"2018-08-07 17:55:38\",\"context\":\"[广州市]快件已发车\"},{\"time\":\"2018-08-07 17:41:08\",\"ftime\":\"2018-08-07 17:41:08\",\"context\":\"[广州市]快件在【广州番禺石北营业点】已装车,准备发往 【广州番禺集散中心】\"},{\"time\":\"2018-08-07 17:15:04\",\"ftime\":\"2018-08-07 17:15:04\",\"context\":\"[广州市]顺丰速运 已收取快件\"}]}"

    stub_request(:get, /poll.kuaidi100.com/).to_return(body: response_body)
  end

  def test_subscribe
    response_body = "{\"result\":false,\"returnCode\":\"700\",\"message\":\"POLL:\xE9\x94\x99\xE8\xAF\xAF\xE7\x9A\x84\xE5\x9B\x9E\xE8\xB0\x83\xE5\x9C\xB0\xE5\x9D\x80\"}"

    stub_request(:get, /poll.kuaidi100.com/).to_return(body: response_body)
  end
end
