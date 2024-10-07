//
//  LogoutViewModel.swift
//  QuickCuts
//
//  Created by Amit Kumar Dhal on 07/10/24.
//

import Foundation

class LogoutViewModel: ObservableObject {
    let baseURL: String = "http://localhost:7200/api/auth/user"
    
    func logOutUser() {
            guard let url = URL(string: "\(baseURL)/logout") else {
                print("Invalid URL for logout")
                return
            }
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            // Get user ID from UserDefaults
            let bodyData = ["userId": UserDefaults.standard.string(forKey: "userID") ?? ""]
            request.httpBody = try? JSONSerialization.data(withJSONObject: bodyData, options: [])
            
            // Add access token to header if available
            if let authToken = UserDefaults.standard.string(forKey: "authToken") {
                request.setValue("Bearer \(authToken)", forHTTPHeaderField: "Authorization")
            }
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                
                if let error = error {
                    print("Error in logOut: \(error.localizedDescription)")
                    return
                }
                
                if let httpResponse = response as? HTTPURLResponse {
                    DispatchQueue.main.async {
                        if httpResponse.statusCode == 200 {
                            // Clear user data from UserDefaults
                            UserDefaults.standard.removeObject(forKey: "authToken")
                            UserDefaults.standard.removeObject(forKey: "userID")
                            UserDefaults.standard.removeObject(forKey: "email")
                            UserDefaults.standard.removeObject(forKey: "userName")
                            UserDefaults.standard.removeObject(forKey: "phoneNumber")
                            UserDefaults.standard.removeObject(forKey: "avatarURL")
                            UserDefaults.standard.set(false, forKey: "isLoggedIn")
                            
                        } else {
                            print("Logout Failed with StatusCode: \(httpResponse.statusCode)")
                        }
                    }
                }
            }.resume()
        }
    }
