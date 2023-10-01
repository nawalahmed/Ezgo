//
//  ordersData.swift
//  COpenSSL
//
//  Created by Nawal Ahmed on 18/07/2023.
//

import Foundation
import PerfectSQLite
import PerfectHTTP
import PerfectHTTPServer
import SwiftyBeaver

enum Keys : String{
    case packageName,
         description,
         weight,
         length,
         width,
         height,
         shipmentValue,
         handlingDetails,
         pickupLocation,
         houseNo,
         streetNo,
         Area,
         fullName,
         countryCode,
         contact,
         nickname,
         pickupDate,
         deliveryLocation,
         deliveryHouseNo,
         deliveryStreetNo,
         deliveryArea,
         deliveryFullName,
         deliveryCountryCode,
         deliveryContact,
         deliveryNickname
}

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

func processData(data: [[String: Any]]) -> [String: Any] {
    
    let data = data[0]
    createSQLiteDatabase(data)
    // Process the received data (you can store it in a database, log it, etc.)
    print("Received data: \(data)")
    
    return [
        "successful": true
    ]
}

fileprivate func storeInDB(_ sqlite: SQLite, _ data: [String: Any]) throws {
    
    try sqlite.execute(statement: "CREATE TABLE IF NOT EXISTS orders (id INTEGER PRIMARY KEY, packageName TEXT, description TEXT, weight DOUBLE, length DOUBLE, width DOUBLE, height DOUBLE, shipmentValue INTEGER, handlingDetails TEXT, pickupLocation TEXT, houseNo TEXT, streetNo TEXT, Area TEXT, fullName TEXT, countryCode TEXT, contact INTEGER, nickname TEXT, pickupDate TEXT, deliveryLocation TEXT, deliveryHouseNo TEXT, deliveryStreetNo TEXT, deliveryArea TEXT, deliveryFullName TEXT, deliveryCountryCode TEXT, deliveryContact TEXT, deliveryNickname TEXT)")
    
    // Insert data into the table
    try sqlite.execute(statement: "INSERT INTO orders (packageName, description, weight, length, width, height, shipmentValue, handlingDetails, pickupLocation, houseNo, streetNo, Area, fullName, countryCode, contact, nickname, pickupDate, deliveryLocation, deliveryHouseNo, deliveryStreetNo, deliveryArea, deliveryFullName, deliveryCountryCode, deliveryContact, deliveryNickname) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", doBindings: {
        stmt in
        let packageName: String = data[Keys.packageName.rawValue] as! String
        let description: String = data[Keys.description.rawValue] as! String
        let weight: String = data[Keys.weight.rawValue] as! String
        let length: String = data[Keys.length.rawValue] as! String
        let width: String = data[Keys.width.rawValue] as! String
        let height: String = data[Keys.height.rawValue] as! String
        let shipmentValue: String = data[Keys.shipmentValue.rawValue] as! String
        let handlingDetails: String = data[Keys.handlingDetails.rawValue] as! String
        let pickupLocation: String = data[Keys.pickupLocation.rawValue] as! String
        let houseNo: String = data[Keys.houseNo.rawValue] as! String
        let streetNo: String = data[Keys.streetNo.rawValue] as! String
        let Area: String = data[Keys.Area.rawValue] as! String
        let fullName: String = data[Keys.fullName.rawValue] as! String
        let countryCode: String = data[Keys.countryCode.rawValue] as! String
        let contact: String = data[Keys.contact.rawValue] as! String
        let nickname: String = data[Keys.nickname.rawValue] as! String
        let pickupDate: String = data[Keys.pickupDate.rawValue] as! String
        let deliveryLocation: String = data[Keys.deliveryLocation.rawValue] as! String
        let deliveryHouseNo: String = data[Keys.deliveryHouseNo.rawValue] as! String
        let deliveryStreetNo: String = data[Keys.deliveryStreetNo.rawValue] as! String
        let deliveryArea: String = data[Keys.deliveryArea.rawValue] as! String
        let deliveryFullName: String = data[Keys.deliveryFullName.rawValue] as! String
        let deliveryCountryCode: String = data[Keys.deliveryCountryCode.rawValue] as! String
        let deliveryContact: String = data[Keys.deliveryContact.rawValue] as! String
        let deliveryNickname: String = data[Keys.deliveryNickname.rawValue] as! String
        try stmt.bind(position: 1, packageName)
        try stmt.bind(position: 2, description)
        try stmt.bind(position: 3, weight)
        try stmt.bind(position: 4, length)
        try stmt.bind(position: 5, width)
        try stmt.bind(position: 6, height)
        try stmt.bind(position: 7, shipmentValue)
        try stmt.bind(position: 8, handlingDetails)
        try stmt.bind(position: 9, pickupLocation)
        try stmt.bind(position: 10, houseNo)
        try stmt.bind(position: 11, streetNo)
        try stmt.bind(position: 12, Area)
        try stmt.bind(position: 13, fullName)
        try stmt.bind(position: 14, countryCode)
        try stmt.bind(position: 15, contact)
        try stmt.bind(position: 16, nickname)
        try stmt.bind(position: 17, pickupDate)
        try stmt.bind(position: 18, deliveryLocation)
        try stmt.bind(position: 19, deliveryHouseNo)
        try stmt.bind(position: 20, deliveryStreetNo)
        try stmt.bind(position: 21, deliveryArea)
        try stmt.bind(position: 22, deliveryFullName)
        try stmt.bind(position: 23, deliveryCountryCode)
        try stmt.bind(position: 24, deliveryContact)
        try stmt.bind(position: 25, deliveryNickname)
    })
}

fileprivate func retreiveFromDB(_ sqlite: SQLite) throws {
    //retreive
    var contentDict = [[String: Any]]()

    let demoStatement = "SELECT id, packageName, description FROM orders ORDER BY id DESC LIMIT :1"
    
    try sqlite.forEachRow(statement: demoStatement, doBindings: {
        
        (statement: SQLiteStmt) -> () in
        
        let bindValue = 1
        try statement.bind(position: 1, bindValue)
        
    }) {(statement: SQLiteStmt, i:Int) -> () in
        
                    contentDict.append([
                        "id": statement.columnText(position: 0),
                        "packageName": statement.columnText(position: 1),
                        "description": statement.columnText(position: 2)
                    ])
        
        print("COtent DICT: \(contentDict)")
        

        SwiftyBeaver.info("Row: ID=\(contentDict[0]["id"] ?? ""), Name=\(contentDict[0]["packageName"] ?? ""), desc=\(contentDict[0]["description"] ?? "")")
        
        
        let orders: [[String: Any]] = [
            ["id": contentDict[0]["id"], "customer": contentDict[0]["packageName"], "orderDate": "2023-08-01", "status": "Open", "totalAmount": 100],
            ["id": 2, "customer": "Jane Smith", "orderDate": "2023-08-02", "status": "In Progress", "totalAmount": 150],
            ["id": 3, "customer": "Bob Johnson", "orderDate": "2023-08-03", "status": "Complete", "totalAmount": 80]
        ]

        
        
    }
}



func createSQLiteDatabase(_ data: [String: Any]) {
    
    let dbPath = "./myDatabase.sqlite" // Change this to the path where you want to store the database file
    
    do {
        let sqlite = try SQLite(dbPath)
        defer {
            sqlite.close() // Make sure to close the database when done
        }
        
        try storeInDB(sqlite, data)

        try retreiveFromDB(sqlite)
        
    } catch {
        //Handle Errors
    }
    
    
}

