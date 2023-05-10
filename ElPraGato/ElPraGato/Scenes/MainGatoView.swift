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
                .font(.custom("Poppins-Bold", size: 40))
                .foregroundColor(Color("MainFontColor"))
        }
    }
}

struct MainGatoView_Previews: PreviewProvider {
    static var previews: some View {
        MainGatoView()
            .previewDevice("iPhone 14")
    }
}
