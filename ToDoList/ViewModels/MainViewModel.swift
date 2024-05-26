//
//  MainViewModel.swift
//  ToDoList
//
//  Created by Jin on 19/5/24.
//

import Foundation
import FirebaseAuth

class MainViewModel:ObservableObject{
    @Published var currentUserId:String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init(){
        self.handler = Auth.auth().addStateDidChangeListener {[weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    func isUserSigned() -> Bool{
        return Auth.auth().currentUser?.uid != nil
    }
}
