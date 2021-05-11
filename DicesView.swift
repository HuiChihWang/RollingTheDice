//
//  DicesView.swift
//  RollingTheDice
//
//  Created by Hui Chih Wang on 2021/5/11.
//

import SwiftUI

struct DicesView: View {
    var dicePoint: [Int]
    
    var body: some View {
        HStack(spacing: 50) {
            ForEach(dicePoint, id: \.self) { point in
                DiceView(point: point)
            }
        }
    }
}

struct DiceView: View {
    let point: Int
    var body: some View {
        Image("dice \(point)")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .background(
                Color.white
                    .padding(15)
            )
    }
}

struct DicesView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            DicesView(dicePoint: [5, 6])
        }
    }
}
