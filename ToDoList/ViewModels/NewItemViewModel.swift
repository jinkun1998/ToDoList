//
//  NewItemViewModel.swift
//  ToDoList
//
//  Created by Jin on 19/5/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewModel:ObservableObject{
    
    @Published var title:String=""
    @Published var dueDate:Date=Date()
    @Published var showAlert:Bool=false
    
    init(){}
    
    func save(){
        guard canSave else{
            return
        }
        
        // get current user id
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        
        // create model
        let newItemId = UUID().uuidString
        let newItem = ToDoListItem(
            id: newItemId,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false)
        
        // save model
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(newItemId)
            .setData(newItem.asDictionary())
    }
    
    var canSave:Bool{
        guard !title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else{
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else{
            return false
        }
        
        return true
    }
    
    
}
