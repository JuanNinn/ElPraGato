//
//  GameStateIndicator.swift
//  ElPraGato
//
//  Created by Juan Harrington on 11/05/23.
//

import SwiftUI

struct GameStateIndicator: View {
    
    var winnerGameState = ""
    
    var body: some View {
        HStack {
            Image(systemName: "person.circle")
                .resizable()
                .frame(maxWidth: 30, maxHeight: 30)
                .foregroundColor(Color("GrayImagesColor"))
            VStack {
                Text("\(winnerGameState)")
                    .font(.custom("Poppins-Regular", size: 57))
                    .foregroundColor(Color("DarkFontColor"))
            }
        }
        .padding()
        .background(Color("MainCenterContainerColor"))
        .cornerRadius(20)
        .padding(.horizontal)
    }
}

struct GameStateIndicator_Previews: PreviewProvider {
    static var previews: some View {
        GameStateIndicator()
    }
}
