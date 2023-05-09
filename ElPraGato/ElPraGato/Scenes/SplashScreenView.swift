//
//  SplashScreenView.swift
//  ElPraGato
//
//  Created by Juan Harrington on 9/05/23.
//

import SwiftUI

struct SplashScreenView: View {
    @State var isActive : Bool = false
    
    // Customise your SplashScreen here
    var body: some View {
        if isActive {
            MainGatoView()
        } else {
            VStack {
                Image("LogoPragato")
                    .resizable()
                    .ignoresSafeArea()
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
