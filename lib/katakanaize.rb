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
    new_body = [NKF.nkf('-wh2', response[0])]
    Rack::Response.new(new_body, status, headers).finish
  end
end
