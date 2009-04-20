require 'rubygems'
require 'sinatra'

use Rack::Session::Cookie

helpers do
  def flash
    @_flash ||= {}
  end
  def redirect(uri, *args)
    session[:_flash] = flash unless flash.empty?
    status 302
    response['Location'] = uri
    halt(*args)
  end
end

before do
  @_flash, session[:_flash] = session[:_flash], nil if session[:_flash]
end
