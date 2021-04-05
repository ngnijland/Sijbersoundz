//
//  AVDelegate.swift
//  Sijbersounz
//
//  Created by Niek Nijland on 03/04/2021.
//

import AVKit

class AVDelegate: NSObject, AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        NotificationCenter.default.post(name: NSNotification.Name("FinishPlaying"), object: player)
    }
}
