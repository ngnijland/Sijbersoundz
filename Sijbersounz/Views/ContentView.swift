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
            
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Text("SIJBER")
                        .fontWeight(.heavy)
                        .padding(.trailing, -7)
                    Text("SOUNDZ")
                        .fontWeight(.light)
                }
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding(.horizontal, 10)
                
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach((0...15), id: \.self) { pad in
                        Pad(color: .yellow, title: "Patatjes")
                    }
                }.padding(10)
            }.padding(.top, -20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
