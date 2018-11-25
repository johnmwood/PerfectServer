import PerfectHTTP
import PerfectHTTPServer
import PerfectPostgreSQL

//do {
//let status = p.connectdb("host=localhost dbname=PerfectServer")
//    defer {
//        p.close() // close the connection
//    }
//} catch {
//    fatalError("\(error)") // fails to make connection to postgresDB
//}
let p = PGConnection()
let status = p.connectdb("host=localhost dbname=PerfectServer")
let result = p.exec(
    statement: """
        SELECT first_name
        FROM users
        WHERE id = 1;
    """)
let name = result.getFieldString(tupleIndex: 0, fieldIndex: 0)

// create routes for server
var routes = Routes()
routes.add(method: .get, uri: "/") {
    request, response in
    response.setHeader(.contentType, value: "text/html")
    response.appendBody(string: "<html><title>Hello, world!</title><body>Hello, \(name ?? "user name not found")!</body></html>")
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
