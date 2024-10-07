//
//  ContentView.swift
//  QuickCuts
//
//  Created by Amit Kumar Dhal on 07/09/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var userViewModel: LoginViewModel = LoginViewModel()
    
    var body: some View {
        if UserDefaults.standard.bool(forKey: "isLoggedIn") {
            TabBar()
                .environmentObject(userViewModel)
        }
        else {
            LoginView()
                .environmentObject(userViewModel)
        }
    }
}

#Preview {
    ContentView()
}
