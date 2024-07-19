require_relative 'server/http_server'
require_relative 'controller/controller'
require 'artii'

a = Artii::Base.new font: 'slant'
puts a.asciify('HTTP Server')

server = HTTP::Server.new

server.route('/info', Controller.method(:getInfo))
server.route('/products', Controller.method(:getAllProducts))

server.start
