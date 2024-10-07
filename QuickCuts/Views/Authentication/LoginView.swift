import SwiftUI

struct LoginView: View {
    @EnvironmentObject var userViewModel: LoginViewModel

    var body: some View {
        ScrollView (showsIndicators: false) {
            VStack(spacing: 20) {
               
                VStack(spacing: 16) {
                    Text("Login")
                        .font(.custom("Poppins-Bold", size: 26))
                        .foregroundColor(.init("textColor"))
                }

                VStack(alignment: .leading, spacing: 5) {
                    Text("Email")
                        .foregroundColor(.init("textColor"))
                        .fontWeight(.medium)
                    
                    TextField("Enter your email", text: $userViewModel.email)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                }

                VStack(alignment: .leading, spacing: 5) {
                    Text("Password")
                        .foregroundColor(.init("textColor"))
                        .fontWeight(.medium)

                    HStack {
                        if userViewModel.isPasswordVisible {
                            TextField("Enter your password", text: $userViewModel.password)
                        } else {
                            SecureField("Enter your password", text: $userViewModel.password)
                        }
                        Button(action: {
                            userViewModel.isPasswordVisible.toggle()
                        }) {
                            Image(systemName: userViewModel.isPasswordVisible ? "eye" : "eye.slash")
                                .foregroundColor(.gray)
                        }
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                }

                VStack (spacing: 20) {
                    Button(action: {
                        userViewModel.login()
                    }) {
                        Text("Login")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(.init("buttonColor")))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    NavigationLink(destination: { SignUpView() }, label: {
                        Text("Sign up")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.init("textColor"))
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                    })
                }
                .padding(.top, 20)

                HStack {
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(Color.gray.opacity(0.5))
                    Text("OR")
                        .foregroundColor(.gray)
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(Color.gray.opacity(0.5))
                }

                VStack(spacing: 10) {
                    Button(action: {}) {
                        HStack {
                            Image(systemName: "envelope.fill")
                                .foregroundColor(Color("textColor"))
                                .font(.system(size: 15))
                            Spacer()
                            Text("Login with Email")
                                .font(.custom("Poppins-Regular", size: 15))
                                .foregroundColor(.init("textColor"))
                                .frame(maxWidth: .infinity, alignment: .center)
                            Spacer()
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                    }

                    Button(action: {}) {
                        HStack {
                            Image(systemName: "applelogo")
                                .foregroundColor(Color("textColor"))
                                .font(.system(size: 22))
                            Spacer()
                            Text("Login with Apple")
                                .font(.custom("Poppins-Regular", size: 15))
                                .foregroundColor(.init("textColor"))
                                .frame(maxWidth: .infinity, alignment: .center)
                            Spacer()
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                    }

                    Button(action: {}) {
                        HStack {
                            Image(systemName: "globe")
                                .foregroundColor(Color("textColor"))
                                .font(.system(size: 18))
                            Spacer()
                            Text("Login with Google")
                                .font(.custom("Poppins-Regular", size: 15))
                                .foregroundColor(.init("textColor"))
                                .frame(maxWidth: .infinity, alignment: .center)
                            Spacer()
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                    }
                }

                Spacer()
            }
            .padding(.horizontal, 16)
            .background(Color(.systemBackground))
        }
        .clipped()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

