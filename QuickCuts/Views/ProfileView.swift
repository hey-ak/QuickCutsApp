//
//  ProfileView.swift
//  QuickCuts
//
//  Created by Akshay Jha on 10/09/24.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var userViewModel: LoginViewModel
    @StateObject private var logoutViewModel = LogoutViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            
            ScrollView {
                VStack(spacing: 10) {
                    
                    VStack(spacing: 16) {
                        Text("Profile ")
                            .font(.custom("Poppins-Regular", size: 24).bold())
                            .foregroundColor(.init("textColor"))
                    }
                    
                    VStack(spacing: 10) {
                        Image("rabbit")
                            .resizable()
                            .clipShape(Circle())
                            .frame(width: 120, height: 120)
                        
                        Text(UserDefaults.standard.string(forKey: "userName") ?? "Akshay Jha")
                            .font(.custom("Poppins-Regular", size: 24).bold())
                            .foregroundColor(Color("textColor"))
                        
                        Text(UserDefaults.standard.string(forKey: "email") ?? "hey.akshay@gmail.com")
                            .font(.custom("Poppins-Regular", size: 16))
                            .foregroundColor(Color("textColor"))
                    }
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Account Settings")
                        .font(.custom("Poppins-Regular", size: 22).bold())
                        .foregroundColor(Color("textColor"))
                        .padding(.horizontal)
                        .padding(.bottom)
                    
                    VStack(spacing: 0) {
                        NavigationLink(destination: Text("My Bookings")) {
                            HStack {
                                Image(systemName: "calendar")
                                    .foregroundColor(Color("textColor"))
                                Text("My Bookings")
                                    .font(.custom("Poppins-Regular", size: 18))
                                    .foregroundColor(Color("textColor"))
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                            .padding()
                        }
                        
                        Divider()
                        
                        NavigationLink(destination: Text("Payment Methods")) {
                            HStack {
                                Image(systemName: "creditcard")
                                    .foregroundColor(Color("textColor"))
                                Text("Payment Methods")
                                    .font(.custom("Poppins-Regular", size: 18))
                                    .foregroundColor(Color("textColor"))
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                            .padding()
                        }
                        
                        Divider()
                        
                        NavigationLink(destination: Text("Edit Profile")) {
                            HStack {
                                Image(systemName: "pencil")
                                    .foregroundColor(Color("textColor"))
                                Text("Edit Profile")
                                    .font(.custom("Poppins-Regular", size: 18))
                                    .foregroundColor(Color("textColor"))
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                            .padding()
                        }
                        
                        Divider()
                        
                        NavigationLink(destination: Text("Logout")) {
                            HStack {
                                Image(systemName: "rectangle.portrait.and.arrow.right")
                                    .foregroundColor(Color("textColor"))
                                Text("Settings")
                                    .font(.custom("Poppins-Regular", size: 18))
                                    .foregroundColor(Color("textColor"))
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                            .padding()
                        }
                        .onTapGesture {
                            // logoutViewModel.logOutUser()
                        }
                    }
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
                }
                .padding(.top, 30)
                
                Spacer()
            }
            .clipped()
        }
        .background(Color(UIColor.systemGray6).edgesIgnoringSafeArea(.all))
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

