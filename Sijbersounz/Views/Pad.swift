//
//  Pad.swift
//  Sijbersounz
//
//  Created by Niek Nijland on 26/03/2021.
//

import SwiftUI
import AVKit

struct Pad: View {
    @State private var player: AVAudioPlayer?
    @State private var isPlaying: Bool = false
    @State private var del = AVDelegate()
    
    var color: Color
    var title: String?
    
    var body: some View {
        Button(action: {
            if(player != nil) {
                if player?.isPlaying == true {
                    player?.pause()
                    player?.currentTime = 0
                    player?.play()
                } else {
                    player?.play()
                }
                
                isPlaying = true
            }
        }) {
            ZStack {
                Rectangle()
                    .background(Color.red)
                    .opacity(0)
                    .aspectRatio(1, contentMode: .fit)
                
                VStack {
                    Spacer()
                    
                    if title != nil {
                        Text(title!)
                            .padding([.bottom, .leading, .trailing], 10)
                    }
                }
            }
        }
        .buttonStyle(
            PadStyle(
                color: title != nil ? color : Color(red: 0.875, green: 0.867, blue: 0.878),
                isPlaying: isPlaying
            )
        )
        .onAppear {
            if let path = Bundle.main.path(forResource: "jemoeder", ofType: "m4a") {
                player = AVAudioPlayer()
                
                let url = URL(fileURLWithPath: path)
                
                do {
                    player = try AVAudioPlayer(contentsOf: url)
                    player?.delegate = del
                    player?.prepareToPlay()
                    
                    NotificationCenter.default.addObserver(
                        forName: NSNotification.Name("FinishPlaying"),
                        object: player,
                        queue: .main
                    ) { (_) in
                        isPlaying = false
                    }
                } catch {
                    print("Error")
                }
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
        Pad(color: Color(red: 0.957, green: 0.490, blue: 0.6))
            .previewLayout(.fixed(width: 86.0, height: 86.0))
    }
}
