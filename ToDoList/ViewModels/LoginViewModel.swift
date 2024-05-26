//
//  LoginViewModel.swift
//  ToDoList
//
//  Created by Jin on 19/5/24.
//

import Foundation
import FirebaseAuth

class LoginViewModel:ObservableObject{
    @Published var email=""
    @Published var password=""
    @Published var errorMessage=""
    
    init(){}
    
    func validate() -> Bool{
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            errorMessage = "Please fill in all fields."
            return false
        }
        
        guard email.contains("@") && email.contains(".") else{
            errorMessage = "Please enter valid email."
            return false
        }
        
        return true
    }
    
    func login(){
        guard validate() else{
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password)
        
        print("called")
    }
}
