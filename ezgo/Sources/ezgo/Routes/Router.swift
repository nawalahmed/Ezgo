//
//  Router.swift
//  ezgo
//
//  Created by Nawal Ahmed on 19/07/2023.
//

import PerfectLib
import PerfectHTTP
import PerfectHTTPServer
import Foundation

func setupRouter() -> Routes {
    var routes = Routes()
    
    routes.add(method: .get, uri: "/orders") { request, response in
        OrdersListController().handleOrdersListRequest(request: request, response: response)
    }
    
    routes.add(method: .get, uri: "/details/{id}") { request, response in
        OrdersDetailController().handleOrdersDetailRequest(request: request, response: response)
    }
    
    routes.add(method: .post, uri: "/sendData", handler: { request, response in
        OrdersDataController().handleDataRequest(request: request, response: response)
    })
    
    routes.add(method: .get, uri: "/word", handler: { request, response in
        MustacheHelper(values: [:]).renderAdminPanel(request: request, response: response)
    })
    
    return routes
}
