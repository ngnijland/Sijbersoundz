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
            
            VStack(alignment: .leading) {
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
                    ForEach(sounds, id: \.self) { sound in
                        Pad(
                            color: sound.color,
                            title: sound.title,
                            fileName: sound.file.name,
                            fileType: sound.file.type
                        )
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
