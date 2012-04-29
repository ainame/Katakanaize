# -*- coding: utf-8 -*-
require File.dirname(__FILE__) + '/spec_helper'

describe "Katakanaize" do
  describe "カタカナ化をして文字コードが壊れていないかどうか" do
    include Rack::Test::Methods

    describe "utf-8" do
      utf8_body = File.open("#{$spec_dir}/utf8.txt").read
      let(:app) { Katakanaize.new( TestRackApp.new(utf8_body) ) }
      converted_body = NKF.nkf("-wh2", utf8_body)

      it "カタカナ化できている" do
        get '/'
        last_response.body.should include(converted_body)
      end

      it "文字コードが保たれている" do
        get '/'
        last_response.body.encoding.to_s.should == "UTF-8"
      end
    end

    describe "euc-jp" do
      eucjp_body = File.open("#{$spec_dir}/eucjp.txt").read
      let(:app) { Katakanaize.new( TestRackApp.new(eucjp_body) ) }
      converted_body = NKF.nkf("-eh2", eucjp_body)

      it "カタカナ化できている" do
        get '/'
        last_response.body.should include(converted_body)
      end
      
      it "文字コードが保たれている" do
        get '/'
        last_response.body.encoding.to_s.should == "EUC-JP"
      end
    end

    describe "shift-jis" do
      shiftjis_body = File.open("#{$spec_dir}/sjis.txt").read
      let(:app) { Katakanaize.new( TestRackApp.new(shiftjis_body) ) }
      converted_body = NKF.nkf("-sh2", shiftjis_body)

      it "カタカナ化できている" do
        get '/'
        last_response.body.should include(converted_body)
      end

      it "文字コードが保たれている" do
        get '/'
        last_response.body.encoding.to_s.should == "Shift_JIS"
      end
    end

    describe "iso-2022-jp" do
      iso2022jp_body = File.open("#{$spec_dir}/iso2022jp.txt").read
      let(:app) { Katakanaize.new( TestRackApp.new(iso2022jp_body) ) }
      converted_body = NKF.nkf("-jh2", iso2022jp_body)

      it "カタカナ化できている" do
        get '/'
        last_response.body.should include(converted_body)
      end

      it "文字コードが保たれている" do
        get '/'
        last_response.body.encoding.to_s.should == "ISO-2022-JP"
      end
    end


  end    


end


