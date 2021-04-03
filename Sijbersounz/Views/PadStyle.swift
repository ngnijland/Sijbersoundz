//
//  PadButton.swift
//  Sijbersounz
//
//  Created by Niek Nijland on 27/03/2021.
//

import SwiftUI

struct PadStyle: ButtonStyle {
    var color: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(color)
            .foregroundColor(.black)
            .font(.system(size: 8))
            .multilineTextAlignment(.center)
            .cornerRadius(4)
    }
}
