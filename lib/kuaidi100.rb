require 'kuaidi100/sign'
require 'kuaidi100/service'
require "kuaidi100/version"

module Kuaidi100
  class << self
    attr_accessor :key, :customer, :callbackurl, :salt
  end
end
