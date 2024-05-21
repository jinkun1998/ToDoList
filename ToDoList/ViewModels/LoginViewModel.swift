//
//  LoginViewModel.swift
//  ToDoList
//
//  Created by Jin on 19/5/24.
//

import Foundation

class LoginViewModel:ObservableObject{
    @Published var email=""
    @Published var password=""
    @Published var errorMessage=""
    
    init(){}
    
    func validate(){
        
    }
    
    func login(){
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            errorMessage = "Please fill in all fields"
            return
        }
        
        print("called")
    }
}
