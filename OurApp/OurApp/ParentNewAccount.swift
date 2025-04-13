//
//  ParentNewAccount.swift
//  OurApp
//
//  Created by Elena Marquez on 4/13/25.
//

import SwiftUI

struct ParentNewAccount: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var reEnteredPassword: String = ""
    @State private var errorMessage: String = ""
    @State private var navigateToHome: Bool = false
    
    var body: some View {
        ZStack {
            Color(red: 0.23, green: 0.18, blue: 0.30)
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                Text("Create New Account")
                    .font(Font.custom("Anta", size: 50))
                    .foregroundColor(Color(red: 0.48, green: 0.85, blue: 0.77))
                    .padding(.bottom, 40)
                    .multilineTextAlignment(.center)
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 300, height: 85)
                        .background(Color(red: 0.52, green: 0.45, blue: 0.61))
                        .cornerRadius(15)
                        .shadow(
                            color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 9, y: 4
                        );
                    
                    TextField("Enter your email", text: $email)
                        .font(Font.custom("Anta", size: 24))
                        .frame(width: 266, height: 85)
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                }.padding(.bottom, 30)
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 300, height: 85)
                        .background(Color(red: 0.52, green: 0.45, blue: 0.61))
                        .cornerRadius(15)
                        .shadow(
                            color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 9, y: 4
                        );
                    
                    SecureField("Enter your password", text: $password)
                        .textContentType(.password)
                        .font(Font.custom("Anta", size: 24))
                        .frame(width: 266, height: 85)
                        .autocapitalization(.none)
                        .keyboardType(.default)
                        .disableAutocorrection(true)
                }.padding(.bottom, 30)
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 300, height: 85)
                        .background(Color(red: 0.52, green: 0.45, blue: 0.61))
                        .cornerRadius(15)
                        .shadow(
                            color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 9, y: 4
                        );
                    
                    SecureField("Re-enter your password", text: $reEnteredPassword)
                        .textContentType(.password)
                        .font(Font.custom("Anta", size: 24))
                        .frame(width: 266, height: 85)
                        .autocapitalization(.none)
                        .keyboardType(.default)
                        .disableAutocorrection(true)
                }
                
                Text(errorMessage)
                    .foregroundColor(.red)
                
                Button(action: {
                    if isValidEmail(email: email) {
                        if isValidPassword(password: password) {
                            if doPasswordsMatch(password: password, reEnteredPassword: reEnteredPassword) {
                                saveCredentials(email: email, password: password)
                                navigateToHome = true
                            } else {
                                errorMessage = "Passwords do not match."
                            }
                        } else {
                            errorMessage = "Please enter a valid password, minimum 8 characters."
                        }
                    } else {
                        errorMessage = "Please enter a valid email."
                    }
                }) {
                    Text("Create Account")
                        .padding()
                        .font(Font.custom("Anta", size: 22))
                        .background(Color(red: 0.52, green: 0.45, blue: 0.61))
                        .foregroundColor(Color(red: 0.48, green: 0.85, blue: 0.77))
                        .cornerRadius(15)
                }
            }
            .navigationDestination(isPresented: $navigateToHome) {
                ParentHomePage()
            }
        }
    }

    func isValidEmail(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: email)
    }
    
    func isValidPassword(password: String) -> Bool {
        let minLength = 8
        return password.count >= minLength
    }
    
    func doPasswordsMatch(password: String, reEnteredPassword: String) -> Bool {
        return password == reEnteredPassword
    }

    func saveCredentials(email: String, password: String) {
        UserDefaults.standard.set(email, forKey: "userEmail")
        UserDefaults.standard.set(password, forKey: "userPassword")
    }
}

#Preview {
    ParentNewAccount()
}

