//
//  UserDetailView.swift
//  RollingTheDice
//
//  Created by Hui Chih Wang on 2021/5/13.
//

import SwiftUI
import Kingfisher

struct UserDetailView: View {
    var user: User {
        didSet {
            name = user.name
        }
    }
    
    @State var name: String = ""
    
    var body: some View {
        VStack {
            KFImage(user.imageURL)
                .clipShape(Circle())
            
            ResponsiveTextFieldView(placeHolder: "Name", input: $name)
        }
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static let user = User(name: "Gilbert")
    static var previews: some View {
        UserDetailView(user: user)
    }
}
