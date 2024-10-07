//
//  LaunchScreen.swift
//  QuickCuts
//
//  Created by Akshay Jha on 09/09/24.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            Spacer()
            
        
            ZStack {
                Circle()
                    .fill(Color("LogoBackgroundColor"))
                    .frame(width: 220, height: 220)
                
                VStack(spacing: 12) {
                    Image("quickCutslogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120, height: 120)
                    Text("Quick Cuts")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(Color("textColor"))
                        .padding(.top, 8)
                }
            }
            .padding(.top, 80)
            
          
            Text("Welcome to Quick Cuts")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(Color("PrimaryColor"))
                .padding(.top, 30)
            
          
            Text("Quick Cuts is your go-to app for booking stylish haircuts and grooming services with just a click. Our platform connects you with nearby salons, offering convenience and quality.")
                .font(.system(size: 16))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
                .padding(.top, 10)
            
            Spacer()
            
           
            Button(action: {
                
            }) {
                Text("Get Started")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("buttonColor"))
                    .cornerRadius(10)
                    .padding(.horizontal, 30)
            }
            .padding(.bottom, 50)
        }
        .background(Color("BackgroundColor")) // 
        .edgesIgnoringSafeArea(.all)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}

