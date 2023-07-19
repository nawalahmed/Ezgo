//
//  OrdersDetailController.swift
//  ezgo
//
//  Created by Nawal Ahmed on 19/07/2023.
//

import Foundation
import PerfectLib
import PerfectHTTP
import PerfectHTTPServer


class OrdersDetailController {

    func handleOrdersDetailRequest(request: HTTPRequest, response: HTTPResponse) {
        do {
            guard let orderId: Int = Int(request.urlVariables["id"] ?? "") else {
                response.setBody(string: "Id is missing")
                    .completed(status: .badRequest)
                return
                
            }
            let orderDetails = getOrdersDetailData().filter { details in
                if let id = details["id"] as? Int {
                    return id == orderId
                    
                }
                return false
                
            }
            try response.setBody(json: orderDetails)
                .setHeader(.contentType, value: "application/json")
                .completed(status: .ok)
            
        } catch {
            response.setBody(string: "Something went wrong")
                .completed(status: .internalServerError)
            
        }
    }
}
