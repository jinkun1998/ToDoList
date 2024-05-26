//
//  ContentView.swift
//  ToDoList
//
//  Created by Jin on 19/5/24.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        if viewModel.isUserSigned(), !viewModel.currentUserId.isEmpty{
            accountView
        }
        else{
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View{
        TabView{
            ToDoListView(userId: self.viewModel.currentUserId)
                .tabItem { Label("Hone", systemImage: "house") }
            
            ProfileView()
                .tabItem { Label("Profile", systemImage: "person.circle") }
        }
    }
}

#Preview {
    MainView()
}
