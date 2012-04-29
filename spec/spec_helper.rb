# -*- coding: utf-8 -*-
$:.unshift File.expand_path File.join File.dirname(__FILE__), "../lib"
$:.unshift File.expand_path File.dirname(__FILE__)
$spec_dir = File.dirname(__FILE__)

require "rspec"
require "rack/test"
require "katakanaize"
require "nkf"

class TestRackApp
  #異なる文字コードのテキストを返すため
  def initialize(text)
    @body = text
  end

  def call(env)
    case env['PATH_INFO']
    when '/'
      [200, {"Content-Type" => "text/html"}, [@body]]
    when '/404'
      [404, {"Content-Type" => "image/jpg"}, [@body]]
    when '/image.jpg'
      [200, {"Content-Type" => "image/jpg"}, [@body]]
    end
  end
end






