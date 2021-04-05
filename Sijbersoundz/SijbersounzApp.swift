//
//  SijbersounzApp.swift
//  Sijbersounz
//
//  Created by Niek Nijland on 20/03/2021.
//

import SwiftUI
import AVKit

@main
struct SijbersounzApp: App {
    init() {
        let audioSession = AVAudioSession.sharedInstance()
        
        do {
            try audioSession.setCategory(
                AVAudioSession.Category.playback,
                options: AVAudioSession.CategoryOptions.mixWithOthers
            )
        } catch {
            print("Could not set audio session category")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
