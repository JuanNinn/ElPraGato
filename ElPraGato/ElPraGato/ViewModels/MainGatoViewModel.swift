//
//  MainGatoViewModel.swift
//  ElPraGato
//
//  Created by Juan Harrington on 10/05/23.
//

import Foundation

@MainActor class MainGatoViewModel: ObservableObject {
    @Published var viewContent = MainGatoViewContent(positionIdentifier: [11:"",
                                                                          12:"",
                                                                          13:"",
                                                                          21:"",
                                                                          22:"",
                                                                          23:"",
                                                                          31:"",
                                                                          32:"",
                                                                          33:""])
    @Published var currentTurnSign: String = "X"
    
    var whoWins = ""
    
    var anyWins = false
    
    func makeAPlay(squareId: Int) {
        asignAPlay(squareId: squareId)
    }
    
    func asignAPlay(squareId: Int) {
        if viewContent.positionIdentifier[squareId] == "" {
            viewContent.positionIdentifier[squareId] = currentTurnSign
        } else {
            
        }
        print("\(viewContent.positionIdentifier) ")
        checkWin()
        adjustCurrentTurn()
    }
    
    func checkWin() {
        if (viewContent.positionIdentifier[11] == "X") && (viewContent.positionIdentifier[12] == viewContent.positionIdentifier[11]) && (viewContent.positionIdentifier[13] == viewContent.positionIdentifier[11]) {
            print(currentTurnSign)
        } else {
            print("No wins")
        }
    }
    
    func adjustCurrentTurn() {
        if currentTurnSign == "X" {
            currentTurnSign = "O"
        } else {
            currentTurnSign = "X"
        }
    }
}
