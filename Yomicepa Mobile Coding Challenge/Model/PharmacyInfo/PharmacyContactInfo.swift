//
//  PharmacyContactInfo.swift
//  Yomicepa Mobile Coding Challenge
//
//  Created by Michael Hany on 18/07/2024.
//

import Foundation

struct PharmacyContactInfo : Decodable {
    var id: Int
    var createdAt: String
    var updatedAt: String
    var firstName: String
    var lastName: String
    var email: String
    var title: String
    var phone: String
    var fax: String
    var additionalContact2: String
    var additionalContact1: String
}
