//
//  ordersData.swift
//  COpenSSL
//
//  Created by Nawal Ahmed on 18/07/2023.
//

import Foundation

func getOrdersList() -> [[String: Any]] {
    
    return [
        ["id": 1,
         "order_number": "EZ303",
         "package_number": 10,
         "shipment_status": "pending",
         "payment_status": "successful"
        ], ["id": 2,
            "order_number": "EZ304",
            "package_number": 1,
            "shipment_status": "delivered",
            "payment_status": "successful"
        ]
    ]
    
}

func getOrdersDetailData() -> [[String: Any]] {
    
    return [
        ["id": 1,
         "order_number": "EZ303",
         "package_number": 10,
         "created_on": "27/10/2022",
         "weight": "0.31 kg",
         "total_charges": 26.25,
         "shipment_status": "pending",
         "delivery_type": "Express",
         "payment_status": "successful"
        ], ["id": 2,
            "order_number": "EZ304",
            "package_number": 1,
            "created_on": "27/10/2022",
            "weight": "0.45 kg",
            "total_charges": 20,
            "shipment_status": "delivered",
            "delivery_type": "Express",
            "payment_status": "successful"
        ]
    ]
    
}
