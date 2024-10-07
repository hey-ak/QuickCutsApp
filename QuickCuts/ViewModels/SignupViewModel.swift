//
//  SignupViewModel.swift
//  QuickCuts
//
//  Created by Amit Kumar Dhal on 07/10/24.
//


import Foundation
import Combine

class SignUpViewModel: ObservableObject {
    @Published var userName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var phoneNumber: String = ""
    @Published var isRegistered: Bool = false
    let baseURL: String = "http://localhost:7200/api/auth/user"
    
    func signUp() {
        
        guard let url = URL(string: "\(baseURL)/register") else {
            print("Invalid URL for registration")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let bodyData = ["userName": userName, "email": email, "password": password]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: bodyData, options: [])
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                print("Error while registering user: \(error.localizedDescription)")
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                DispatchQueue.main.async {
                    if httpResponse.statusCode == 201 {
                        self.isRegistered = true
                    }
                    else {
                        print("Registration failed with statusCode: \(httpResponse.statusCode)")
                    }
                }
            }
            
        }.resume()
        
    }
}
