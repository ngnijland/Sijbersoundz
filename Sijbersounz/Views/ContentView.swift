//
//  ContentView.swift
//  Sijbersounz
//
//  Created by Niek Nijland on 20/03/2021.
//

import SwiftUI

struct ContentView: View {
    var columns: [GridItem] = [.init(.flexible()), .init(.flexible()), .init(.flexible()), .init(.flexible())]
    
    var body: some View {
        ZStack {
            Color(red: 0.051, green: 0.051, blue: 0.051)
                .edgesIgnoringSafeArea(.all)
            
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach((0...15), id: \.self) { pad in
                    Pad(color: .yellow)
                }
            }.padding(10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
