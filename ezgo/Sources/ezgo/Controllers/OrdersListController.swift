//
//  OrdersListController.swift
//  COpenSSL
//
//  Created by Nawal Ahmed on 18/07/2023.
//

import Foundation
import PerfectLib
import PerfectHTTP
import PerfectHTTPServer


class OrdersListController {

    func handleOrdersListRequest(request: HTTPRequest, response: HTTPResponse) {
        do {
            try response.setBody(json: getOrdersList())
                .setHeader(.contentType, value: "application/json")
                .completed(status: .ok)
        } catch {
            response.setBody(string: "Something went wrong")
                .completed(status: .internalServerError)
        }
    }
}
