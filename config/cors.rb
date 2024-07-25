require 'sinatra'
require 'json'

before do
  content_type :json
  headers 'Access-Control-Allow-Origin' => '*',
          'Access-Control-Allow-Methods' => ['GET'],
          'Access-Control-Allow-Headers' => 'Content-Type'
end

options '*' do
  200
end