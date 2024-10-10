//
//  UserModel.swift
//  St_Proj
//
//  Created by user on 10.10.2024.
//

import Foundation

struct UserModel: Codable {
    var id: UUID
    var name: String
    var phone: String
    var created_at: Date
}
