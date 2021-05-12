//
//  GameView.swift
//  RollingTheDice
//
//  Created by Hui Chih Wang on 2021/5/11.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var gameModel = GameViewModel()
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [ Color(#colorLiteral(red: 0.3529411765, green: 0.2470588235, blue: 0.2156862745, alpha: 1)), Color(#colorLiteral(red: 0.1725490196, green: 0.4666666667, blue: 0.2666666667, alpha: 1))]), startPoint: .leading, endPoint: .trailing)
                .ignoresSafeArea()
            
            VStack {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 200, alignment: .center)
                    .padding(.top, 30)
                
                UserView(user: gameModel.currentPlayer)
                    .frame(width: 250, height: 100, alignment: .center)
                
                DicesView(dicePoint: gameModel.diceNumber)
                    .padding(.horizontal, 30)
                    .padding(.vertical, 50)
                
                Spacer()
                
                if !gameModel.isRolling {
                    GameButtonView(title: "Roll", color: .yellow) {
                        gameModel.rollDices()
                    }
                    .frame(width: 200, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
                else {
                    GameButtonView(title: "Stop", color: .red) {
                        gameModel.stopRolling()
                    }
                    .frame(width: 200, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
                
                Spacer()
            }
        }
        .navigationBarHidden(true)
    }
}



struct GameButtonView: View {
    let title: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(color)
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.black, lineWidth: 3.0)
                        )
                )
                .overlay(
                    Text(title)
                        .font(.system(size: 30, weight: .semibold, design: .monospaced))
                        .foregroundColor(.white)
                )
        }
    }
}

struct UserView: View {
    let user: User
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .foregroundColor(.blue)
            
            VStack {
                HStack(spacing: 20) {
                    Image(systemName: "person")
                        .resizable()
                        .scaledToFill()
                        .background(Color.gray)
                        .clipShape(Circle())
                        .frame(width: 60, height: 60)
                        .overlay(
                            Circle()
                                .stroke(Color.white, lineWidth: 3)
                        )
                        
                    Text("Gilbert")
                        .font(.system(size: 30, weight: .bold, design: .monospaced))

                }
                .padding(.bottom, 10)
                
                Text("You've already got \(user.highestPoint) points")
            }
            .padding(10)
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
