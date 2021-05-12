//
//  WelcomeView.swift
//  RollingTheDice
//
//  Created by Hui Chih Wang on 2021/5/11.
//

import SwiftUI

struct WelcomeView: View {
    @State var userName: String = ""
    @State var isShowGameView = false
    
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
                
                TextField("Enter User Name", text: $userName)
                    .modifier(ResponsiveTextFieldModifier(isInputValid: !userName.isEmpty))
                    .modifier(ClearButton(text: $userName))
                    .frame(width: 350)
                    .padding(.bottom, 10)
                
                if !userName.isEmpty {
                    NavigationLink(destination: GameView(), isActive: $isShowGameView) {
                        PlayButtonView {
                            self.isShowGameView = true
                        }
                    }
                }
            }
        }
    }
}

struct ClearButton: ViewModifier {
    @Binding var text: String
    func body(content: Content) -> some View {
        ZStack {
            content
            
            if !text.isEmpty {
                HStack() {
                    Spacer()
                    Button(action: {
                        text = ""
                    }) {
                        Image(systemName: "xmark.circle")
                            .font(.system(size: 20))
                            .foregroundColor(.gray)
                    }
                    .padding(.trailing, 10)
                }
            }
        }
    }
}

struct ResponsiveTextFieldModifier: ViewModifier {
    var isInputValid = false
    
    func body(content: Content) -> some View {
        content
            .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing:15))
            .overlay(
                RoundedRectangle(cornerRadius: 25.0)
                    .stroke(lineWidth: 3)
                    .foregroundColor(isInputValid ? .blue : .gray)
            )
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
