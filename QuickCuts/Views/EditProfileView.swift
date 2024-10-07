//
//  EditProfileView.swift
//  QuickCuts
//
//  Created by Akshay Jha on 12/09/24.
//

import SwiftUI

struct EditProfileView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var phoneNumber: String = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        Button(action: {}) {
                            Image(systemName: "chevron.left")
                                .foregroundColor(Color("textColor"))
                                .font(.title2)
                        }
                        
                        Spacer()
                        
                        Text("Edit Profile")
                            .font(.custom("Poppins-Regular", size: 24).bold())
                            .foregroundColor(Color("textColor"))
                        
                        Spacer()
                    }
                    .padding([.leading, .top, .trailing])
                    
                    VStack(spacing: 10) {
                        Image("rabbit")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                        
                        Text("Olivia Smith")
                            .font(.custom("Poppins-Regular", size: 22).bold())
                            .foregroundColor(Color("textColor"))
                        
                        Text("@oliviasmith")
                            .font(.custom("Poppins-Regular", size: 14))
                            .foregroundColor(Color.gray)
                    }
                    .padding(.top, 20)
                    
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Name")
                            .font(.custom("Poppins-Regular", size: 16).weight(.medium))
                            .foregroundColor(Color("textColor"))
                        TextField("Enter your name", text: $name)
                            .padding()
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(10)
                        
                        Text("Email")
                            .font(.custom("Poppins-Regular", size: 16).weight(.medium))
                            .foregroundColor(Color("textColor"))
                        TextField("Enter your email", text: $email)
                            .padding()
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(10)
                        
                        Text("Phone Number")
                            .font(.custom("Poppins-Regular", size: 16).weight(.medium))
                            .foregroundColor(Color("textColor"))
                        TextField("Enter your phone number", text: $phoneNumber)
                            .padding()
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(10)
                    }
                    .padding(.top, 30)
                    .padding(.horizontal, 20)
                    
                    Button(action: {}) {
                        Text("Save")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color("buttonColor"))
                            .cornerRadius(10)
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 40)
                }
                .padding(.bottom, 20)
            }.clipped()
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
