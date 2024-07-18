//
//  PharmacyDetails.swift
//  Yomicepa Mobile Coding Challenge
//
//  Created by Michael Hany on 18/07/2024.
//

import Foundation

struct PharmacyDetails : Decodable {
    var id: Int
    var createdAt: String
    var updatedAt: String
    var user: UserDetails
    var enabled: Bool
    var licenseState: String
    var licenseStateCode: String
    var npi: String
    var doingBusinessAs: String
    var legalBusinessName: String
    var companyType: String
    var reimbursementType: String
    var directDepositInfo: String
    var wholesalersLinks: [WholesalersLink]
    var dea: String
}
