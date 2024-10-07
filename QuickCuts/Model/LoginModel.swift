//
//  LoginModel.swift
//  QuickCuts
//
//  Created by Amit Kumar Dhal on 07/10/24.
//

import Foundation

// Model for the entire response
struct LoginResponse: Codable {
    let success: Bool
    let token: String
    let user: User
}
