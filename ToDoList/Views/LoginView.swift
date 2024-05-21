//
//  LoginView.swift
//  ToDoList
//
//  Created by Jin on 19/5/24.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationView{
            VStack {
                // Header
                HeaderView(title: "To Do List", subTitle: "Get things done", angle: 15, backgroudColor: Color.pink)
                
                // Login form
                Form{
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    TextField("Email", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                        
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(
                        title: "Log in",
                        backgroundColor: .blue,
                        textColor: .white) {
                            viewModel.login()
                        }
                        .padding()
                }
                .offset(y: -50)
                    
                // Create account button
                VStack(){
                    Text("New around here")
                    NavigationLink("Create an account") {
                        RegisterView()
                    }
                    
                }
                .padding(.bottom, 10)
                
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
