//
//  Songs.swift
//  msPlay-Project
//
//  Created by Andy Salim on 06/01/23.
//

import UIKit

class Songs: NSObject {
    var songTitle: String
    var songArtists: String
    var songTrack: String
    var songCover: String

    init(songTitle: String, songArtists: String, songTrack: String, songCover: String) {
        self.songTitle = songTitle
        self.songArtists = songArtists
        self.songTrack = songTrack
        self.songCover = songCover
    }
    
}
