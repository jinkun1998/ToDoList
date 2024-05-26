//
//  RegisterView.swift
//  ToDoList
//
//  Created by Jin on 19/5/24.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewModel()
    
    var body: some View {
        VStack{
            // header
            HeaderView(title: "Register", subTitle: "Start organizing todo", angle: -15, backgroudColor: Color.orange)
                
            // register form
            Form{
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                }
                
                TextField("Full name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TextField("Email", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButton(
                    title: "Create account",
                    backgroundColor: .green,
                    textColor: .white) {
                        viewModel.register()
                    }
                    .padding()
                
            }
            .offset(y:-50)
        
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
