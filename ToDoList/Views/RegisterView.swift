//
//  RegisterView.swift
//  ToDoList
//
//  Created by Jin on 19/5/24.
//

import SwiftUI

struct RegisterView: View {
    
    @State var fullName = ""
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack{
            // header
            HeaderView(title: "Register", subTitle: "Start organizing todo", angle: -15, backgroudColor: Color.orange)
                
            // register form
            Form{
                TextField("Full name", text: $fullName)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TextField("Email", text: $email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                
                SecureField("Password", text: $password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButton(
                    title: "Create account",
                    backgroundColor: .green,
                    textColor: .white) {
                        // action
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
