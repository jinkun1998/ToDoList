//
//  ProfileViewModel.swift
//  ToDoList
//
//  Created by Jin on 19/5/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ProfileViewModel:ObservableObject{
    
    @Published var user: User? = nil
    
    func getCurrentUser(){
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .getDocument(completion: {[weak self] snapshot, error in
                guard let data = snapshot?.data(), error == nil else{
                    return
                }
                
                DispatchQueue.main.async {
                    self?.user = User(
                        id: data["id"] as? String ?? "",
                        name: data["name"] as? String ?? "",
                        email: data["email"] as? String ?? "",
                        joined: data["joined"] as? TimeInterval ?? 0
                    )
                }
            })
    }
    
    func signOut(){
        do{
            try Auth.auth().signOut()
        }
        catch{
            print(error)
        }
    }
}
