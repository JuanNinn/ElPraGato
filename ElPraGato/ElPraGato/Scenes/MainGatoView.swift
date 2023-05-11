//
//  MainGatoView.swift
//  ElPraGato
//
//  Created by Juan Harrington on 9/05/23.
//

import SwiftUI

extension MainGatoView {
    @ViewBuilder
    static func build() -> some View {
        MainGatoView(viewModel: MainGatoViewModel())
    }
}

struct MainGatoView: View {
    
    @StateObject var viewModel: MainGatoViewModel
    
    
    var body: some View {
        ZStack{
            Color("PrimaryContainerColor")
            VStack {
                Spacer()
                HStack(spacing: 25){
                    Text("Jugador 1 O")
                        .font(.custom("Poppins-Regular", size: 16))
                        .padding(10)
                        .padding(.horizontal)
                        .background(.white)
                        .cornerRadius(30)
                        .foregroundColor(Color("MainFontColor"))
                    Text("Jugador 2 X")
                        .font(.custom("Poppins-Regular", size: 16))
                        .padding(10)
                        .padding(.horizontal)
                        .background(.white)
                        .cornerRadius(30)
                        .foregroundColor(Color("MainFontColor"))
                }
                .padding(.bottom, 20)
                Button("Inicia la partida") {
                    
                }
                .font(.custom("Poppins-Regular", size: 24))
                .foregroundColor(Color(.black))
                HStack {
                    ForEach(0..<3) { rowOne in
                        VStack {
                            ForEach(0..<3) { row in
                                Text(String(viewModel.viewContent.positionIdentifier[Int("\(rowOne + 1)\(row + 1)") ?? 0] ?? ""))
                                    .font(.system(size: 65))
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .background(Color("PrimaryContainerColor"))
                                    .onTapGesture {
                                        viewModel.makeAPlay(squareId: Int("\(rowOne + 1)\(row + 1)") ?? 0)
                                    }
                            }
                        }
                    }
                }
                .background(Color("AccentColor"))
                .padding(50)
                .padding(.vertical, 70)
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
        MainGatoView.build()
            .previewDevice("iPhone 14")
    }
}
