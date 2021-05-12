//
//  WelcomeView.swift
//  RollingTheDice
//
//  Created by Hui Chih Wang on 2021/5/11.
//

import SwiftUI

struct WelcomeView: View {
    @State private var userName: String = ""
    @State private var isShowGameView = false
    @EnvironmentObject private var gameModel: GameViewModel
        
    var body: some View {
        NavigationView {
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
                
                ResponsiveTextFieldView(placeHolder: "Enter User Name", input: $userName)
                    .frame(width: 350)
                    .padding(.bottom, 10)

                
                if !userName.isEmpty {
                    NavigationLink(
                        destination: GameView(),
                        isActive: $isShowGameView) {
                        PlayButtonView {
                            gameModel.loadUser(name: userName)
                            self.isShowGameView = true
                        }
                    }
                }
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}

struct PlayButtonView: View {
    let action: () -> Void
    var body: some View {
        Button(action: action, label: {
            HStack {
                Image(systemName: "play.fill")
                Text("PLAY")
            }
        })
    }
}
