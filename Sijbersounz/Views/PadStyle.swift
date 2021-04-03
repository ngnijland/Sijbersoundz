//
//  PadButton.swift
//  Sijbersounz
//
//  Created by Niek Nijland on 27/03/2021.
//

import SwiftUI

struct PadStyle: ButtonStyle {
    var color: Color
    var isPlaying: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(isPlaying ? Color.red : color)
            .foregroundColor(.black)
            .font(.system(size: 8))
            .multilineTextAlignment(.center)
            .cornerRadius(4)
    }
}
