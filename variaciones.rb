require 'socket' # Provides TCPServer and TCPSocket classes

server = TCPServer.new(Socket.gethostname, 1234)
loop do

  socket = server.accept
  # la primera linea
  request = socket.gets
  opcion = request.split("/")[1].split(" ")[0].to_i

  response = "HTTP/1.1 200 OK\r\n\r\n" +
                    "<html><body><h1>VARIACIONES APP</h1>" +
                    "<h2>Introduzca al final de la url la seleccion </h2>"+
                    "<h3>Uso: hostname:1234/(introduzca aqui su seleccion) </h3>"+
                    "<p> 1- Pagina GSYC</p>" +
                    "<p> 2- Pagina ERROR</p>" +
                    "<p> 3- Pagina con imagen</p>" +
                    "<p> 4- Menu</p>" +
                    "</body></html>" +
                    "\r\n"

 gsyc_response = "HTTP/1.1 200 OK\r\n\r\n" +
                  "<html><body><h1>GSYC APP</h1>" +
                  "<p>" +
                  '<a href="https://gsyc.urjc.es"> Pagina del GSYC </a>' +
                  "</p>" + "</body></html>" +
                  "\r\n"

error_response = "HTTP/1.1 404 NOT FOUND\r\n\r\n" +
                 "<html><body><h1>ERROR 404</h1>" +
                 "<h2> PAGE NOT FOUND </H2>" +
                 "</body></html>" +
                 "\r\n"

img_response = "HTTP/1.1 200 OK\r\n\r\n" +
                  "<html><body><h1>IMG APP</h1>" +
                  '<img src="http://www.cafe.se/wp-content/uploads/2017/02/salt-bae.gif">' +
                  "</body></html>" +
                  "\r\n"

usage_response = "HTTP/1.1 200 OK\r\n\r\n" +
                  "<html><body><h1></h1>" +
                  '<h1> USO INCORRECTO</h1>' +
                  "<h2> Introduzca 4 en la url para volver al menu </h2>" +
                  "</body></html>" +
                  "\r\n"

case opcion
   when 1 then socket.print gsyc_response
   when 2 then socket.print error_response
   when 3 then socket.print img_response
   when 4 then socket.print response
   else socket.print response
end

  # Close the socket, terminating the connection
  socket.close
end
