//
//  WholesalersLink.swift
//  Yomicepa Mobile Coding Challenge
//
//  Created by Michael Hany on 18/07/2024.
//

import Foundation

struct WholesalersLink : Decodable {
    var address: String
    var city: String
    var state: String
    var zipCode: String
    var pharmacyID: Int
    var wholesalerID: Int
    var primary: Bool
    
    enum CodingKeys: String, CodingKey {
        case address
        case city
        case state
        case zipCode
        case pharmacyID = "pharmacyId"
        case wholesalerID = "wholesalerId"
        case primary
    }
}
