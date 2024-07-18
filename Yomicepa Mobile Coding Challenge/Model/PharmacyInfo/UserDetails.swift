//
//  UserDetails.swift
//  Yomicepa Mobile Coding Challenge
//
//  Created by Michael Hany on 18/07/2024.
//

import Foundation

struct UserDetails : Decodable {
    var activated : Bool
    var createdAt : String
    var email : String
    var id : Int
    var phoneNumber : String
    var role : String
    var updatedAt : String
    var username : String
}
