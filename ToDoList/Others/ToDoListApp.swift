//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Jin on 19/5/24.
//

import SwiftUI
import FirebaseCore

@main
struct ToDoListApp: App {
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
