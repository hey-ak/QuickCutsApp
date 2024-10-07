//
//  LoginViewModel.swift
//  QuickCuts
//
//  Created by Amit Kumar Dhal on 07/10/24.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isLoggedIn: Bool = false
    @Published var isPasswordVisible: Bool = false
    let baseURL: String = "http://localhost:7200/api/auth/user"
    
    func login() {
        guard let url = URL(string: "\(baseURL)/login") else {
            print("Invalid URL for login")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let bodyData = ["email": email, "password": password]
        request.httpBody = try? JSONSerialization.data(withJSONObject: bodyData, options: [])
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error logging in user: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("Received nil data")
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                do {
                    let decodedResponse = try JSONDecoder().decode(LoginResponse.self, from: data)
                    
                    // Direct assignment for non-optional fields
                    let userID = decodedResponse.user.id
                    let email = decodedResponse.user.email
                    let userName = decodedResponse.user.name
                    
                    // Optionally unwrap the optional fields with default values
                    let avatarURL = decodedResponse.user.profilePicture ?? ""
                    let phoneNumber = decodedResponse.user.phoneNumber ?? ""
                    
                    // Token from the response
                    let token = decodedResponse.token
                    
                    DispatchQueue.main.async {
                        // Save user details and token into UserDefaults
                        UserDefaults.standard.set(userID, forKey: "userID")
                        UserDefaults.standard.set(email, forKey: "email")
                        UserDefaults.standard.set(userName, forKey: "userName")
                        UserDefaults.standard.set(true, forKey: "isLoggedIn")
                        UserDefaults.standard.set(phoneNumber, forKey: "phoneNumber")
                        UserDefaults.standard.set(avatarURL, forKey: "avatarURL")
                        UserDefaults.standard.set(token, forKey: "authToken")
                        self.isLoggedIn = true
                    }
                    
                } catch {
                    print("Failed to parse JSON response: \(error.localizedDescription)")
                }
            } else {
                print("Login failed with status code: \((response as? HTTPURLResponse)?.statusCode ?? 0)")
            }
        }.resume()
    }

}
