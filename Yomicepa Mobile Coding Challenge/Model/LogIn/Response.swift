//
//  Model.swift
//  Yomicepa Mobile Coding Challenge
//
//  Created by Michael Hany on 17/07/2024.
//

import Foundation

struct Response : Decodable {
    var userInfo : user
    var token : String
}
