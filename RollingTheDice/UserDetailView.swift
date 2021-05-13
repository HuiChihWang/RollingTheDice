//
//  UserDetailView.swift
//  RollingTheDice
//
//  Created by Hui Chih Wang on 2021/5/13.
//

import SwiftUI
import Kingfisher

struct UserDetailView: View {
    @State var user: User
    @Binding var showDetail: Bool
    @EnvironmentObject var users: Users
    
    var body: some View {
        ZStack {
            VStack {
                Rectangle()
                    .frame(height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Spacer()
            }
            .ignoresSafeArea()
            
            VStack {
                KFImage(user.imageURL)
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.white, lineWidth: 10)
                    )
                    .frame(width: 250, height: 250, alignment: .center)
                    .offset(y: 100)
                    .padding(.bottom, 100)
                    
                Spacer()
                
                VStack(spacing: 20) {
                    ResponsiveTextFieldView(placeHolder: "Name", input: $user.name)
                    
                    
                    HStack {
                        Text("Gender")
                        Spacer()
                        Picker("Gender", selection: $user.gender) {
                            Text(Gender.male.rawValue).tag(Gender.male)
                            Text(Gender.female.rawValue).tag(Gender.female)
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .frame(width: 200)
                    }
                    
                    
                    
                    DatePicker("Birth Day", selection: $user.birthDay, displayedComponents: [.date])
                        .datePickerStyle(CompactDatePickerStyle())
                }
                .padding(.horizontal, 25)
                
                
                Spacer()
                
                Text("You've score \(user.highestPoint) points highest")
                    .font(.custom("Itim-Regular", size: 30))
                    .padding(.bottom, 50)
                
            }
        }
        .navigationBarTitle("Edit User Info", displayMode: .inline)
        .toolbar {
            Button("Done") {
                users.updateUser(user: user)
                showDetail = false
            }
        }
        
    }
}


struct UserDetailView_Previews: PreviewProvider {
    static let users = Users.generateRandomUsers(numberOfUsers: 10)
    static var previews: some View {
        UserDetailView(user: users.users[0], showDetail: .constant(true))
            .environmentObject(users)
    }
}
