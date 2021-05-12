//
//  UserListView.swift
//  RollingTheDice
//
//  Created by Hui Chih Wang on 2021/5/12.
//

import SwiftUI

struct UserListView: View {
    @EnvironmentObject var users: Users
    
    var body: some View {
        NavigationView {
            List {
                ForEach(users.users) { user in
                    NavigationLink(destination: EmptyView()) {
                        UserInfoView(user: user)
                    }
                }
                .onDelete { indexSet in
                    users.removeUser(at: indexSet)
                }
            }
            .navigationBarTitle("Users")
            .navigationBarItems(trailing: EditButton())
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static let users = Users.generateRandomUsers(numberOfUsers: 12)
    
    static var previews: some View {
        UserListView()
            .environmentObject(users)
    }
}
