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
    @Published var gameState = "toStart"
    @Published var mainButtonText = ""
    @Published var whoWins = ""
    
    var numberOfPays = 0
    
    func makeAPlay(squareId: Int) {
        asignAPlay(squareId: squareId)
    }
    
    func asignAPlay(squareId: Int) {
        if viewContent.positionIdentifier[squareId] == "" {
            viewContent.positionIdentifier[squareId] = currentTurnSign
            numberOfPays = numberOfPays + 1
        } else {
            
        }
        print("\(viewContent.positionIdentifier) ")
        checkWin()
        adjustCurrentTurn()
    }
    
    func checkWin() {
        
        //Vertical win cases:
        if (viewContent.positionIdentifier[11] == currentTurnSign) &&
            (viewContent.positionIdentifier[12] == viewContent.positionIdentifier[11]) &&
            (viewContent.positionIdentifier[13] == viewContent.positionIdentifier[11]) ||
            
            (viewContent.positionIdentifier[21] == currentTurnSign) &&
            (viewContent.positionIdentifier[22] == viewContent.positionIdentifier[21]) &&
            (viewContent.positionIdentifier[23] == viewContent.positionIdentifier[21]) ||
            
            (viewContent.positionIdentifier[31] == currentTurnSign) &&
            (viewContent.positionIdentifier[32] == viewContent.positionIdentifier[31]) &&
            (viewContent.positionIdentifier[33] == viewContent.positionIdentifier[31]) ||
            
            //Horizontal win cases:
            
            (viewContent.positionIdentifier[11] == currentTurnSign) &&
            (viewContent.positionIdentifier[21] == viewContent.positionIdentifier[11]) &&
            (viewContent.positionIdentifier[31] == viewContent.positionIdentifier[11]) ||
            
            (viewContent.positionIdentifier[12] == currentTurnSign) &&
            (viewContent.positionIdentifier[22] == viewContent.positionIdentifier[12]) &&
            (viewContent.positionIdentifier[32] == viewContent.positionIdentifier[12]) ||
            
            (viewContent.positionIdentifier[13] == currentTurnSign) &&
            (viewContent.positionIdentifier[23] == viewContent.positionIdentifier[13]) &&
            (viewContent.positionIdentifier[33] == viewContent.positionIdentifier[13]) ||
            
            //Diagonal win cases:
            
            (viewContent.positionIdentifier[11] == currentTurnSign) &&
            (viewContent.positionIdentifier[22] == viewContent.positionIdentifier[11]) &&
            (viewContent.positionIdentifier[33] == viewContent.positionIdentifier[11]) ||
            
            (viewContent.positionIdentifier[13] == currentTurnSign) &&
            (viewContent.positionIdentifier[22] == viewContent.positionIdentifier[13]) &&
            (viewContent.positionIdentifier[31] == viewContent.positionIdentifier[13]){
            
            updateGameState(wishedGameState: currentTurnSign)
            print("\(currentTurnSign) Wins")
        } else if whoWins == "" && numberOfPays >= 9{
            print("Tie")
        }
    }
    
    func adjustCurrentTurn() {
        if currentTurnSign == "X" {
            currentTurnSign = "O"
        } else {
            currentTurnSign = "X"
        }
    }
    
    func updateGameState(wishedGameState: String) {
        if wishedGameState != "" {
            gameState = "finished"
            self.whoWins = wishedGameState
            self.mainButtonText = ""
        } else if wishedGameState == "" {
            gameState = "inProgress"
            self.mainButtonText = "Reiniciar"
        } else if wishedGameState == "restart" {
            gameState = "toStart"
            self.mainButtonText = "Inicia la partida"
        }
        print(gameState)
    }
    
    func restartGame() {
        viewContent = MainGatoViewContent(positionIdentifier: [11:"",
                                                               12:"",
                                                               13:"",
                                                               21:"",
                                                               22:"",
                                                               23:"",
                                                               31:"",
                                                               32:"",
                                                               33:""])
        updateGameState(wishedGameState: "restart")
    }
}
