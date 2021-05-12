//
//  UserInfoView.swift
//  RollingTheDice
//
//  Created by Hui Chih Wang on 2021/5/12.
//

import SwiftUI
import Kingfisher

struct UserInfoView: View {
    let user: User

    var body: some View {
        HStack {
            KFImage(user.imageURL)
                .resizable()
                .scaledToFill()
                .frame(width: 70, height: 70, alignment: .center)
            
            VStack(alignment: .leading, spacing: 10) {
                Text(user.name)
                Text("Highest Score: \(user.highestPoint)")
            }
            Spacer()
        }
    }
}

struct UserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoView(user: User(name: "Gilbert"))
            .previewLayout(.sizeThatFits)
    }
}
