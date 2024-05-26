//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Jin on 19/5/24.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
    
    @StateObject var viewModel : ToDoListViewModel
    @FirestoreQuery var items:[ToDoListItem]
    
    private let userId:String
    
    init(userId:String){
        self.userId  = userId
        
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos")
        
        self._viewModel = StateObject(
            wrappedValue: ToDoListViewModel(userId: userId)
        )
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions(
                            content:{
                                Button("Delete"){
                                    viewModel.delete(id:item.id)
                                }
                                .tint(.red)
                            })
                }
            }
            .navigationTitle(Text("To Do List"))
            .toolbar(content: {
                Button(
                    action: {
                        viewModel.isShowNewItemSheet = true
                }
                   , label: {
                    Image(systemName: "plus")
                })
            })
            .sheet(isPresented: $viewModel.isShowNewItemSheet, content: {
                NewItemView(newItemPresented: $viewModel.isShowNewItemSheet)
            })
        }
    }
}

#Preview {
    ToDoListView(userId: "k1ll2unuM9aXj7TVXknH799C59O2")
}
