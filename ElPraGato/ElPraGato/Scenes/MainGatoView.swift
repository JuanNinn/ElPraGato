//
//  MainGatoView.swift
//  ElPraGato
//
//  Created by Juan Harrington on 9/05/23.
//

import SwiftUI

struct MainGatoView: View {
    var body: some View {
        ZStack{
            Color("PrimaryContainerColor")
            VStack {
                Button("Inicia la partida") {
                    
                }
                .font(.custom("Poppins-Regular", size: 24))
                .foregroundColor(Color(.black))
                Spacer()
                
                Image("mainViewFooter")
                
            }
            .padding(.vertical, 50)
        }
        .ignoresSafeArea()
    }
}

struct MainGatoView_Previews: PreviewProvider {
    static var previews: some View {
        MainGatoView()
            .previewDevice("iPhone 14")
    }
}
