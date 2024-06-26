//
//  ToDoListViewModel.swift
//  ToDoList
//
//  Created by Jin on 19/5/24.
//

import Foundation
import FirebaseFirestore

class ToDoListViewModel:ObservableObject{
    @Published var isShowNewItemSheet:Bool = false
    
    private let userId:String
    
    init(userId:String){
        self.userId = userId
    }
    
    func delete(id:String){
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
