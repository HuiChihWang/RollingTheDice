//
//  Users.swift
//  RollingTheDice
//
//  Created by Hui Chih Wang on 2021/5/12.
//

import Foundation

struct User: Identifiable {
    var name: String
    var highestPoint: Int = 0
    
    var gender: Gender = .male
    var birthDay: Date = Date()
    
    var imageURL: URL? {
        URL(string: "https://picsum.photos/200")
    }
    
    init(name: String = "Unknown") {
        self.name = name
    }
    
    let id = UUID()
}

enum Gender: String, CaseIterable {
    case male = "Male"
    case female = "Female"
    
    static func randomGender() -> Gender {
        Gender.allCases.randomElement()!
    }
}

class Users: ObservableObject{
    
    @Published private(set) var users = [User]()
//    {
//        didSet {
//            users.sort(by: {$0.highestPoint > $1.highestPoint})
//        }
//    }
    
    var userCount: Int {
        users.count
    }
    
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
    
    public func removeUser(user: User) {
        if let index = users.firstIndex(where: {$0.id == user.id}) {
            users.remove(at: index)
        }
    }
    
    public func removeUser(at indexSet: IndexSet) {
        users.remove(atOffsets: indexSet)
    }
    
    public func getUser(by index: Int) -> User? {
        guard (0..<userCount).contains(index) else {
            return nil
        }
        
        return users[index]
    }
}

extension Users {
    public static func generateRandomUsers(numberOfUsers: Int) -> Users {
        let users = Users()
        (0..<numberOfUsers).forEach { _ in
            var user = users.loadUser(name: randomString(length: Int.random(in: 0..<8)))
            user.highestPoint = Int.random(in: 2...12)
            user.birthDay = randomDate()
            user.gender = Gender.randomGender()
            users.updateUser(user: user)
        }
        
        return users
    }
    
    private static func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
      return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
    
    private static func randomDate() -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        let start = formatter.date(from: "1970-01-01")!
        let end = formatter.date(from: "2005-12-31")!
        
        let randomTime = TimeInterval.random(in: start.timeIntervalSinceNow...end.timeIntervalSinceNow)
        return Date(timeIntervalSinceNow: randomTime)
    }
}
