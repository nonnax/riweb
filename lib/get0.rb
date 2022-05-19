#!/usr/bin/env ruby
# Id$ nonnax 2022-05-19 22:08:01 +0800
require 'getr0'
require 'kramdown'
require_relative 'getr0v'

class Getr
  def headers(type: 'html')
    t=['text/html', 'text/plain', 'application/json'].grep(/#{type}/).pop
    res.headers[Rack::CONTENT_TYPE]=[t, 'charset=utf-8;'].join(';')
  end

  def self.enable feature
    send(feature)
  end
  
  def self.views
    ERBView.setup(self)
  end
end

def md(s); Kramdown::Document.new(s).to_html end
def u(s); Rack::Utils.escape(s) end

