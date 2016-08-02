
require 'sinatra'
require 'json'
require 'pp'

get '/webhook' do
  "Hello Webhook"
end

post '/webhook' do
  pp "Receiving Webhook #{params[:webhookId]}"
  pp JSON.parse(params[:result])
end