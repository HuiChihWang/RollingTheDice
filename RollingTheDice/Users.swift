//
//  Users.swift
//  RollingTheDice
//
//  Created by Hui Chih Wang on 2021/5/12.
//

import Foundation

struct User: Identifiable {
    let name: String
    var highestPoint: Int = 0
    
    init(name: String = "Unknown") {
        self.name = name
    }
    
    var id = UUID()
}

class Users {
    var users = [User]()
    
    public func loadUser(name: String) -> User {
        var user = users.first(where: {$0.name == name})
        
        if user == nil {
            user = User(name: name)
            users.append(user!)
        }
        
        return user!
    }
    
    public func updateUser(user: User) {
        if let index = users.firstIndex(where: {user.id == $0.id}) {
            users[index] = user
        }
    }
}
