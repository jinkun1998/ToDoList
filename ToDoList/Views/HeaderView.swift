//
//  HeaderView.swift
//  ToDoList
//
//  Created by Jin on 19/5/24.
//

import SwiftUI

struct HeaderView: View {
    let title:String
    let subTitle:String
    let angle:Double
    let backgroudColor:Color
    
    var body: some View {
        ZStack() {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(backgroudColor)
                .rotationEffect(Angle(degrees: angle))
            
            VStack{
                Text(title)
                    .font(.system(size: 50))
                    .foregroundColor(.white)
                    .bold()
                
                Text(subTitle)
                    .font(.system(size: 30))
                    .foregroundColor(.white)
            }
            .padding(.top, 80)
        }
        .frame(width: UIScreen.main.bounds.width*3, height: 350)
        .offset(y: -150)
    }
}

#Preview {
    HeaderView(title: "Title", subTitle: "Subtitle", angle: 10, backgroudColor: Color.pink)
}
