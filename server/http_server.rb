require 'socket'
require 'json'
require_relative 'default_logger'

module HTTP
  class Server
    def initialize(host: '0.0.0.0', port: 8080, logger: HTTP::Log.create)
      @server = TCPServer.new(host, port)
      @routers = {}
      @logger = logger
    end

    def route(path, controller)
      @routers[path] = controller
    end

    def generate_http_response(status, response)
      body = JSON.generate(response)
      headers = {
        'Access-Control-Allow-Origin' => '*',
        'Access-Control-Allow-Methods' => 'GET',
        'Access-Control-Allow-Headers' => 'Content-Type',
        'Accept-Charset' => 'utf-8',
        'Content-Type' => 'application/json',
        'Content-Length' => body.bytesize.to_s,
        'Connection' => 'close'
      }
      headers_string = headers.map { |key, value| "#{key}: #{value}" }.join("\r\n")
      "HTTP/1.1 #{status} OK\r\n#{headers_string}\r\n\r\n#{body}"
    end

    def start
      @logger.info("Server is listening on port #{@server.addr[1]}")

      loop do
        Thread.new(@server.accept) do |client|
          request = client.gets

          if request
            _, path, = request.split(' ')
            route = path.split('?').first

            @logger.debug("Accessing route: #{route}")

            if @routers[route]
              response_body = @routers[route].call
              response = generate_http_response(200, response_body)
            else
              response_body = { error: 'Not Found' }
              response = generate_http_response(404, response_body)
            end

            client.print response
          end
        rescue StandardError => e
          @logger.error(e.message)
          client.print generate_http_response(500, { error: 'Internal Server Error' })
        ensure
          client.close
        end
      end
    end
  end
end
