#!/usr/bin/env ruby
# Id$ nonnax 2022-05-18 19:38:23 +0800
require_relative 'lib/get0'

Getr.enable :views

App=
Getr.new do

  headers type: 'html'

  on '/search', q: "" do |q|
    res=IO.popen(["ri","-a", q], &:read)
    data=['<div class="article">',md(res),'</div>'].join(' ')
    erb data, q:
  end

  on '/', q: "" do |q|
    res=IO.popen(["ri", '-l'], &:readlines)
    data=res.map{|e| ["<div class='item'><a href='/search?q=#{e}'>", e, "</a></div>"].join }.join(' ')
    erb data, q:
  end
end
