//
//  ContentView.swift
//  Sijbersounz
//
//  Created by Niek Nijland on 20/03/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 0.051, green: 0.051, blue: 0.051)
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
