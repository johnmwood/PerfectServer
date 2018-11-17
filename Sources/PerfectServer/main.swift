import PerfectHTTP
import PerfectHTTPServer
import PerfectPostgreSQL

// create routes for server
var routes = Routes()
routes.add(method: .get, uri: "/") {
    request, response in
    response.setHeader(.contentType, value: "text/html")
    response.appendBody(string: "<html><title>Hello, world!</title><body>Hello, world!</body></html>")
        .completed()
}

//routes.add(method: .post, uri: "/") {
//    return nil
//}

// launch server
do {
    try HTTPServer.launch(.server(name: "www.something.com", port: 8181, routes: routes))
} catch {
    fatalError("\(error)") // fails to load server
}

/*
 
 
 */
