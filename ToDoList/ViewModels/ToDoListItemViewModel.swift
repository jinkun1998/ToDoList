//
//  ToDoListItemViewModel.swift
//  ToDoList
//
//  Created by Jin on 19/5/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ToDoListItemViewModel:ObservableObject{
    
    func toggleIsDone(item:ToDoListItem){
        var newItem = item
        newItem.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(item.id)
            .setData(newItem.asDictionary())
    }
}
