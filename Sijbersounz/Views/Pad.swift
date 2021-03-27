//
//  Pad.swift
//  Sijbersounz
//
//  Created by Niek Nijland on 26/03/2021.
//

import SwiftUI

struct Pad: View {
    var color: Color
    var title: String?
    
    var body: some View {
        Button(action: {
            print("click!")
        }) {
            ZStack {
                RoundedRectangle(cornerRadius: 4.0)
                    .foregroundColor(color)
                    .aspectRatio(1, contentMode: .fit)
                
                VStack {
                    Spacer()
                    
                    if title != nil {
                        Text(title!)
                            .foregroundColor(.black)
                            .font(.system(size: 8))
                            .multilineTextAlignment(.center)
                    }
                }
                .padding([.bottom, .leading, .trailing], 10)
            }
        }
    }
}

struct Pad_Previews: PreviewProvider {
    static var previews: some View {
        Pad(color: Color(red: 0.62, green: 0.867, blue: 0.824), title: "Patatjes")
            .previewLayout(.fixed(width: 86.0, height: 86.0))
        Pad(color: Color(red: 0.6, green: 0.761, blue: 0.463), title: "Kermis kermis kermis")
            .previewLayout(.fixed(width: 86.0, height: 86.0))
        Pad(color: Color(red: 0.957, green: 0.490, blue: 0.6), title: "Postcodekanjers")
            .previewLayout(.fixed(width: 86.0, height: 86.0))
    }
}
