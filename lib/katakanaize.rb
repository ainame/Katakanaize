# -*- coding: utf-8 -*-
require 'katakanaize/version'
require 'rack/response'
require 'nkf'

class Katakanaize
  def initialize(app)
    @app = app
  end

  def call(env)
    response = @app.call(env)
    body = response[2][0]
    new_body = NKF.nkf('-wh2', body)
    new_response = Rack::Response.new do |res|
      res.status = 200
      res['Content-Type'] = 'text/html'
      res.write new_body
    end
    new_response.finish
  end
end
