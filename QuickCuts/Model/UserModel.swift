//
//  UserModel.swift
//  QuickCuts
//
//  Created by Amit Kumar Dhal on 07/10/24.
//

import Foundation

// Model for the user details
struct User: Codable {
    let id: String
    let name: String
    let email: String
    let password: String
    let profilePicture: String?
    let phoneNumber: String?
    let createdAt: String
    let updatedAt: String
    let v: Int

    // Custom CodingKeys to map the JSON keys to Swift properties
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case email
        case password
        case profilePicture
        case phoneNumber
        case createdAt
        case updatedAt
        case v = "__v"
    }
}
