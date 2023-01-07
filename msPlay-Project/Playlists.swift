//
//  Playlists.swift
//  msPlay-Project
//
//  Created by Andy Salim on 06/01/23.
//

import UIKit

class Playlists: NSObject {
    var playlistTitle: String
    var playlistSongs: [Songs]
    var playlistCover: String
    
    init(playlistTitle: String, playlistSongs: [Songs], playlistCover: String) {
        self.playlistTitle = playlistTitle
        self.playlistSongs = playlistSongs
        self.playlistCover = playlistCover
    }
    
}
