//
//  ToDoListItemsView.swift
//  ToDoList
//
//  Created by Jin on 19/5/24.
//

import SwiftUI

struct ToDoListItemView: View {
    
    @StateObject var viewModel = ToDoListItemViewModel()
    
    let item:ToDoListItem
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(item.title)
                    .font(.body)
                    .bold()
                
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            
            Button(
               action: {
                   viewModel.toggleIsDone(item: item)
            }, label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill":"circle")
                    .foregroundColor(.blue)
            })
        }
    }
}

#Preview {
    ToDoListItemView(item: .init(id: "123", title: "123", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: true))
}
