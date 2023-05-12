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
    @Published var mainButtonText = "Inicia la partida"
    @Published var isMainButtonEnable = false
    @Published var showGameState = false
    @Published var currentGameStateSheetText = ""
    
    private var gameState = "toStart"
    private var whoWins = ""
    private var numberOfPays = 0
    
    func makeAPlay(section: Int, row: Int) {
        asignAPlay(squareId: Int("\(section + 1)\(row + 1)") ?? 0)
    }
    
    func asignAPlay(squareId: Int) {
        if viewContent.positionIdentifier[squareId] == "" {
            viewContent.positionIdentifier[squareId] = currentTurnSign
            numberOfPays = numberOfPays + 1
        } else {
            
        }
        checkWin()
        adjustCurrentTurn()
        updateGameState(wishedGameState: "")
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
            (viewContent.positionIdentifier[31] == viewContent.positionIdentifier[13]) {
            
            updateGameState(wishedGameState: currentTurnSign)
        } else if numberOfPays >= 9{
            updateGameState(wishedGameState: "Empate")
        }
    }
    
    func adjustCurrentTurn() {
        if numberOfPays <= 8{
            if currentTurnSign == "X" {
                currentGameStateSheetText = "Ganador Jugador 1"
                currentTurnSign = "O"
            } else {
                currentGameStateSheetText = "Ganador Jugador 2"
                currentTurnSign = "X"
            }
        } else {
            currentGameStateSheetText = "Empate"
        }
    }
    
    func updateGameState(wishedGameState: String) {
        if wishedGameState == "X" || wishedGameState == "O" {
            gameState = "finished"
            self.mainButtonText = "a"
            self.showGameState = true
            
        } else if wishedGameState == "Empate" {
            gameState = "Finished"
            self.mainButtonText = "e"
            self.showGameState = true
            
        } else if wishedGameState == "" {
            gameState = "inProgress"
            self.mainButtonText = "Reiniciar"
            self.isMainButtonEnable = true
            
        } else if wishedGameState == "toStart" {
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
        updateGameState(wishedGameState: "toStart")
        isMainButtonEnable = false
        showGameState = false
        numberOfPays = 0
        currentTurnSign = "X"
    }
}
