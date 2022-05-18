#!/usr/bin/env ruby
# Id$ nonnax 2022-05-18 19:38:23 +0800
require 'numa'
require 'kramdown'

def md(s); Kramdown::Document.new(s).to_html end
def u(s); Rack::Utils.escape(s) end
App=
Numa.new do
  res.headers[Rack::CONTENT_TYPE]='text/html; charset=utf-8;'
  on '/', q: "\b" do |q|
    res=IO.popen(["ri", q], &:read)
    data=md(res)
    erb data, q:
  end
end
