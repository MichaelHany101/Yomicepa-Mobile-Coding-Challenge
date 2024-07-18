//
//  PharmacyAddressInfo.swift
//  Yomicepa Mobile Coding Challenge
//
//  Created by Michael Hany on 18/07/2024.
//

import Foundation

struct PharmacyAddressInfo: Decodable {
    var id: Int
    var createdAt: String
    var updatedAt: String
    var address1: String
    var address2: String
    var city: String
    var state: String
    var zip: String
}
