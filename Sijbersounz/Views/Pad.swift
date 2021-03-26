//
//  Pad.swift
//  Sijbersounz
//
//  Created by Niek Nijland on 26/03/2021.
//

import SwiftUI

struct Pad: View {
    var body: some View {
        Button(action: {
            print("click!")
        }) {
            RoundedRectangle(cornerRadius: 4.0)
                .foregroundColor(.blue)
                .aspectRatio(1, contentMode: .fit)
        }
    }
}

struct Pad_Previews: PreviewProvider {
    static var previews: some View {
        Pad()
    }
}
