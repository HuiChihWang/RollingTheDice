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
                
                DicesView(dicePoint: gameModel.diceNumber)
                    .padding(.horizontal, 30)
                    .padding(.vertical, 50)
                
                Spacer()
                
                Button(action: {
                    gameModel.rollDices()
                }) {
                        Text("Roll The Dice")
                            .font(.system(size: 25, weight: .medium, design: .monospaced))
                            .foregroundColor(.white)
                            .padding(20)
                            .background(Color.red)
                            .cornerRadius(20)
                            .padding(10)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(.white)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.black, lineWidth: 3.0)
                                    )
                            )
                }
                .frame(width: 300, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                Spacer()
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}


