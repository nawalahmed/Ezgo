import PerfectLib
import Foundation
import PerfectHTTP
import PerfectHTTPServer
import SwiftyBeaver
import PerfectMustache

@main
public struct ezgo {

    public static func main() {
        
        let file = FileDestination()

        file.logFileURL = URL(fileURLWithPath: "/Users/nawalahmed/Documents/Developer/ezgo/logfile.log")
        SwiftyBeaver.addDestination(file)
        
        let server = HTTPServer()
        server.documentRoot = "webroot"
        
        server.serverPort = 8080
        server.addRoutes(setupRouter())
        
        
        
        do {
            try server.start()
        } catch {
            print("Error starting server \(error)")
        }
        

    }
}



