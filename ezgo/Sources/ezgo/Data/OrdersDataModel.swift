//
//  OrdersDataModel.swift
//  ezgo
//
//  Created by Nawal Ahmed on 27/07/2023.
//


struct OrdersDataModel: Codable {
    
    let packageName: String
    let description: String
    let weight: Double
    let length: Double
    let width: Double
    let height: Double
    let shipmentValue: Int
    let handlingDetails: String
    
    let pickupLocation: String
    let houseNo: String
    let streetNo: String
    let Area: String
    let fullName: String
    let countryCode: String
    let contact: Int
    let nickname: String
    
    let pickupDate: String
    
    let deliveryLocation: String
    let deliveryHouseNo: String
    let deliveryStreetNo: String
    let deliveryArea: String
    let deliveryFullName: String
    let deliveryCountryCode: String
    let deliveryContact: Int
    let deliveryNickname: String
    
    
}
