//
//  PharmacyInfo.swift
//  Yomicepa Mobile Coding Challenge
//
//  Created by Michael Hany on 18/07/2024.
//

import Foundation

struct PharmacyInfo : Decodable {
    var pharmacy: PharmacyDetails
    var pharmacyCompanyAddressInfo: PharmacyAddressInfo
    var pharmacyMailingAddressInfo: PharmacyAddressInfo
    var pharmacyContactInfo: PharmacyContactInfo
    var promoCode: String
}
