# -*- coding: utf-8 -*-
require 'katakanaize/version'
require 'rack/response'
require 'nkf'

class Katakanaize

  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, response = @app.call(env)
    katakanaized_body = response.map{ |body| katakanaize(body) }
    Rack::Response.new(katakanaized_body, status, headers).finish
  end
  
  private
  def katakanaize(str)
    case NKF.guess(str).to_s
    when "UTF-8"
      NKF.nkf('-wh2', str)
    when "EUC-JP"
      NKF.nkf('-eh2', str)
    when "Shift_JIS"
      NKF.nkf('-sh2', str)
    when "ISO-2022-JP"
      NKF.nkf('-jh2', str)
    end
  end

end
