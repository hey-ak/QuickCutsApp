import SwiftUI

struct SignUpView: View {
    @StateObject private var viewModel = SignUpViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                VStack(spacing: 16) {
                    Text("Sign Up")
                        .font(.custom("Poppins-Bold", size: 26))
                        .foregroundColor(.init("textColor"))
                }
             
                VStack(alignment: .leading) {
                    Text("Full Name")
                        .font(.headline)
                        .foregroundColor(Color("textColor"))
                    TextField("Full Name", text: $viewModel.userName)
                        .padding()
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(10)
                }
                
                VStack(alignment: .leading) {
                    Text("Email")
                        .font(.headline)
                        .foregroundColor(Color("textColor"))
                    TextField("Email", text: $viewModel.email)
                        .padding()
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(10)
                        .keyboardType(.emailAddress)
                }
                
                VStack(alignment: .leading) {
                    Text("Phone Number")
                        .font(.headline)
                        .foregroundColor(Color("textColor"))
                    TextField("Phone Number", text: $viewModel.phoneNumber)
                        .padding()
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(10)
                        .keyboardType(.phonePad)
                }
                
                VStack(alignment: .leading) {
                    Text("Password")
                        .font(.headline)
                        .foregroundColor(Color("textColor"))
                    SecureField("Password", text: $viewModel.password)
                        .padding()
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(10)
                }
                
//                if viewModel.isLoading {
//                    ProgressView()
//                        .padding(.top, 10)
//                } else {
//                    
//                }
                
                Button(action: {
                    viewModel.signUp()
                }) {
                    Text("Sign Up")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color("buttonColor"))
                        .cornerRadius(10)
                }
                .padding(.top, 10)
                
//                if let errorMessage = viewModel.errorMessage {
//                    Text(errorMessage)
//                        .foregroundColor(.red)
//                        .padding(.top, 10)
//                }

                HStack {
                    Text("Already have an account?")
                        .foregroundColor(Color("textColor"))
                    Button(action: {
                        // Navigate to login screen
                    }) {
                        Text("Log In")
                            .fontWeight(.bold)
                            .foregroundColor(Color("buttonColor"))
                    }
                }
                .padding(.top, 30)
            }
            .padding(.horizontal, 16)
        }.clipped()
        .background(Color.white)
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .alert(isPresented: $viewModel.isRegistered) {
            Alert(title: Text("Success"), message: Text("User registered successfully!"), dismissButton: .default(Text("OK")))
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

