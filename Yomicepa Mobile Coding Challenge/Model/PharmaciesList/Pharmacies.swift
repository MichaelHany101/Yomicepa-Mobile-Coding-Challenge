//
//  Pharmacies.swift
//  Yomicepa Mobile Coding Challenge
//
//  Created by Michael Hany on 17/07/2024.
//

import Foundation

struct pharmacy : Decodable {
    var pharmacyId : Int
    var doingBusinessAs : String
    var numberOfReturns : Int
    var enabled : Bool
}
