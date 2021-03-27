//
//  Pad.swift
//  Sijbersounz
//
//  Created by Niek Nijland on 26/03/2021.
//

import SwiftUI
import AVKit

struct Pad: View {
    @State var player: AVAudioPlayer?
    
    var color: Color
    var title: String?
    
    var body: some View {
        Button(action: {
            if(self.player != nil) {
                if self.player?.isPlaying == true {
                    self.player?.pause()
                    self.player?.currentTime = 0
                    self.player?.play()
                } else {
                    self.player?.play()
                }
            }
        }) {
            ZStack {
                RoundedRectangle(cornerRadius: 4.0)
                    .foregroundColor(title != nil ? color : Color(red: 0.875, green: 0.867, blue: 0.878))
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
        .onAppear {
            if let path = Bundle.main.path(forResource: "jemoeder", ofType: "m4a") {
                self.player = AVAudioPlayer()
                
                let url = URL(fileURLWithPath: path)
                
                do {
                    self.player = try AVAudioPlayer(contentsOf: url)
                    self.player?.prepareToPlay()
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
