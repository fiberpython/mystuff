require 'webrick'

server = WEBrick::HTTPServer.new :Port => 5000

#The following proc is used to customize the server operations
server.mount_proc '/' do |request, response|
  response.body = 'Hello, na world!'
end


server.start
