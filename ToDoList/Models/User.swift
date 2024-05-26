//
//  User.swift
//  ToDoList
//
//  Created by Jin on 19/5/24.
//

import Foundation

struct User: Codable{
    let id:String
    let name:String
    let email:String
    let joined:TimeInterval
}
