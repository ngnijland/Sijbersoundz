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
    
    var color: Color?
    var title: String?
    var fileName: String?
    var fileType: String?
    
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
                
                withAnimation(.easeInOut(duration: 0.1)) {
                    isPlaying = true
                }
            }
        }) {
            ZStack {
                RoundedRectangle(cornerRadius: 4)
                    .fill(
                        RadialGradient(
                            gradient: Gradient(colors: [Color.white.opacity(0.67), Color.white.opacity((0))]),
                            center: .center,
                            startRadius: 0,
                            endRadius: 114
                        )
                    )
                    .border(Color.white.opacity(0.67), width: isPlaying ? 2 : 0)
                    .opacity(isPlaying ? 1 : 0)
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
                color: color != nil ? color! : Color(red: 0.875, green: 0.867, blue: 0.878)
            )
        )
        .onAppear {
            if let path = Bundle.main.path(forResource: fileName, ofType: fileType) {
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
                        withAnimation(.easeInOut(duration: 0.1)) {
                            isPlaying = false
                        }
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
        Group {
            Pad(
                color: Color(red: 0.62, green: 0.867, blue: 0.824),
                title: "Patatjes",
                fileName: "je_moeder",
                fileType: "m4a"
            )
                .previewDisplayName("Short title")
                
            Pad(
                color: Color(red: 0.6, green: 0.761, blue: 0.463),
                title: "Kermis kermis kermis",
                fileName: "je_moeder",
                fileType: "m4a"
            )
                .previewDisplayName("Long title")
            
            Pad(
                color: Color(red: 0.957, green: 0.490, blue: 0.6),
                fileName: "je_moeder",
                fileType: "m4a"
            )
                .previewDisplayName("No sound connected disabled")
        }
        .previewLayout(.fixed(width: 86.0, height: 86.0))
    }
}
