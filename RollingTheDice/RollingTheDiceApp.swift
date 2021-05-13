//
//  RollingTheDiceApp.swift
//  RollingTheDice
//
//  Created by Hui Chih Wang on 2021/5/11.
//

import SwiftUI

@main
struct RollingTheDiceApp: App {
    var body: some Scene {
        WindowGroup {
//            WelcomeView()
//                .environmentObject(GameViewModel())
            
            UserListView()
                .environmentObject(Users.generateRandomUsers(numberOfUsers: 12))
        }
    }
}
