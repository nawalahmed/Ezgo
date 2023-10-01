//
//  OrdersDataController.swift
//  ezgo
//
//  Created by Nawal Ahmed on 26/07/2023.
//

import Foundation
import PerfectLib
import PerfectHTTP
import PerfectHTTPServer
import PerfectSQLite

class OrdersDataController {
    
    func convertParametersToDict(from request: HTTPRequest) -> [String: Any] {
        var parameters: [String: Any] = [:]

        // Extract URL query parameters
         let queryParams = request.params()
            for (key, value) in queryParams {
                parameters[key] = value
            }
        
 
        // Extract POST body parameters
         let postParams = request.postParams
            for (key, value) in postParams {
                parameters[key] = value
            }
        

        return parameters
    }
    
    func handleDataRequest(request: HTTPRequest, response: HTTPResponse) {
        
        let parameters = convertParametersToDict(from: request)

            // Now you have the parameters as [String: Any]
            // You can convert them to [[String: Any]] array if needed
            let arrayOfParameters = [parameters]
            print(arrayOfParameters)

        do {
            try response.setBody(json: processData(data: arrayOfParameters))
                .setHeader(.contentType, value: "application/json")
                .completed(status: .ok)
        } catch {
            response.setBody(string: "Something went wrong")
                .completed(status: .internalServerError)
        }
        
    }

}
