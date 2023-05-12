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
        GeometryReader { geometry in
            ZStack{
                Color("PrimaryContainerColor")
                VStack {
                    Spacer()
                    HStack(spacing: 25){
                        Text("Jugador 1 X")
                            .font(.custom("Poppins-Regular", size: 16))
                            .padding(10)
                            .padding(.horizontal)
                            .background(viewModel.currentTurnSign == "X" ? Color("WhiteColor") : Color("UnactiveWhiteColor"))
                            .cornerRadius(30)
                            .foregroundColor(Color("MainFontColor"))
                        Text("Jugador 2 O")
                            .font(.custom("Poppins-Regular", size: 16))
                            .padding(10)
                            .padding(.horizontal)
                            .background(viewModel.currentTurnSign == "O" ? Color("WhiteColor") : Color("UnactiveWhiteColor"))
                            .cornerRadius(30)
                            .foregroundColor(Color("MainFontColor"))
                    }
                    .padding(.bottom, 20)
                    Button(viewModel.mainButtonText) {
                        viewModel.restartGame()
                    }
                    .font(.custom("Poppins-Regular", size: 24))
                    .foregroundColor(Color("GrayFontColor"))
                    .disabled(!viewModel.isMainButtonEnable)
                    
                    ZStack {
                        HStack {
                            ForEach(0..<3) { section in
                                VStack {
                                    ForEach(0..<3) { row in
                                        Text(String(viewModel.viewContent.positionIdentifier[Int("\(section + 1)\(row + 1)") ?? 0] ?? ""))
                                            .font(.system(size: 65))
                                            .frame(maxWidth: geometry.size.width * 0.23, maxHeight: geometry.size.width * 0.23)
                                            .background(Color("PrimaryContainerColor"))
                                            .onTapGesture {
                                                viewModel.makeAPlay(section: section, row: row)
                                            }
                                    }
                                }
                            }
                        }
                        .background(Color("GatoSquareColor"))
                        .opacity(viewModel.showGameState ? 0 : 1)
                        
                        GameStateIndicator(winnerGameState: viewModel.currentGameStateSheetText)
                            .opacity(viewModel.showGameState ? 1 : 0)
                    }
                    
                    Spacer()
                    Image("mainViewFooter")
                        
                }
                .padding(.vertical, 28)
            }
            .ignoresSafeArea()
        }
    }
}

struct MainGatoView_Previews: PreviewProvider {
    static var previews: some View {
        MainGatoView.build()
            .previewDevice("iPhone 14")
    }
}
