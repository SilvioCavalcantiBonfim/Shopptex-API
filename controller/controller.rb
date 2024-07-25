require './service/product_service'
require './service/info_service'
require 'sinatra'
require 'json'

get '/products' do
  content_type :json
  ProductService.getAll.to_json
end


get '/info' do
  content_type :json
  InfoService.create.to_json
end
