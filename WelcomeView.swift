//
//  WelcomeView.swift
//  RollingTheDice
//
//  Created by Hui Chih Wang on 2021/5/11.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .foregroundColor(.yellow)
                    .overlay(Circle().stroke(lineWidth: 4.0))
                Image("welcome")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.top, 20)
                    .frame(width: 240)
            }
            .frame(width: 300, height: 300)
            
            Text("Gambling King")
                .font(.system(size: 45, weight: .bold, design: .rounded))
                .foregroundColor(.red)
        }
    }
    
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
