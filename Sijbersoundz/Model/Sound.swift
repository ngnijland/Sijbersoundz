//
//  Sound.swift
//  Sijbersounz
//
//  Created by Niek Nijland on 04/04/2021.
//

import Foundation
import SwiftUI

struct Sound: Hashable, Codable {
    var title: String
    var file: File
    
    private var colorName: String
    var color: Color {
        switch colorName {
        case "green":
            return Color(red: 0.6, green: 0.761, blue: 0.436)
        case "turquoise":
            return Color(red: 0.62, green: 0.876, blue: 0.824)
        case "pink":
            return Color(red: 0.957, green: 0.49, blue: 0.6)
        case "purple":
            return Color(red: 0.698, green: 0.643, blue: 0.984)
        case "orange":
            return Color(red: 0.922, green: 0.741, blue: 0.498)
        default:
            return Color.yellow
        }
    }

    struct File: Hashable, Codable {
        var name: String
        var type: String
    }
}
