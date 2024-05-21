//
//  TLButton.swift
//  ToDoList
//
//  Created by Jin on 19/5/24.
//

import SwiftUI

struct TLButton: View {
    
    let title:String
    let backgroundColor:Color
    let textColor:Color
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(backgroundColor)
                
                Text(title)
                    .bold()
                    .textFieldStyle(DefaultTextFieldStyle())
                    .foregroundColor(textColor)
                
            }
        })
    }
}

#Preview {
    TLButton(title: "Button", backgroundColor: .blue, textColor: .white, action: {
        //
    })
}
