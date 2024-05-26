//
//  ProfileView.swift
//  ToDoList
//
//  Created by Jin on 19/5/24.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                if viewModel.user != nil{
                    profileView
                }
                else{
                    VStack{
                        Text("Loading profile...")
                        ProgressView()
                    }
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear(){
            viewModel.getCurrentUser()
        }
    }
    
    @ViewBuilder
    var profileView:some View{
        // avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.blue)
            .frame(width: 125, height: 125)
            .padding()
        
        // info: name, email, member since
        VStack(alignment: .leading, content: {
            HStack(content: {
                Text("Name: ")
                Text(viewModel.user?.name ?? "")
            })
            .padding()
            
            HStack{
                Text("Email: ")
                Text(viewModel.user?.email ?? "")
            }
            .padding()
            
            HStack{
                Text("Member since: ")
                Text("\(Date(timeIntervalSince1970: viewModel.user?.joined ?? Date().timeIntervalSince1970).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding()
        })
        .padding()
        
        // sign out
        Button("Sign Out", action: {
            viewModel.signOut()
        })
        .tint(.red)
        .padding()
        
        Spacer()
    }
}

#Preview {
    ProfileView()
}
