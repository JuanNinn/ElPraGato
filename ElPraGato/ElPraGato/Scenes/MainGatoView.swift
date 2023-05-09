//
//  MainGatoView.swift
//  ElPraGato
//
//  Created by Juan Harrington on 9/05/23.
//

import SwiftUI

struct MainGatoView: View {
    var body: some View {
        VStack {
            Text("equisdelol")
                .foregroundColor(Color("MainFontColor"))
                .font(.title)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainGatoView()
            .previewDevice("iPhone 14")
    }
}
