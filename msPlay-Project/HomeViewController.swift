//
//  ViewController.swift
//  msPlay-Project
//
//  Created by Andy Salim on 07/12/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    public static var songLists = [Songs]()
    public static var playLists = [Playlists]()
    
//    Input Lagu Lokal
    func addSongs() {
        HomeViewController.songLists.append(Songs(songTitle: "Lost Stars", songArtists: "Adam Levine", songTrack: "Adam Levine - Lost Stars", songCover: "adamlevine_cover"))
        HomeViewController.songLists.append(Songs(songTitle: "Grenade", songArtists: "Bruno Mars", songTrack: "Bruno Mars - Grenade", songCover: "brunomars_cover"))
        HomeViewController.songLists.append(Songs(songTitle: "Love Story", songArtists: "Taylor Swift", songTrack: "Taylor Swift - Love Story", songCover: "taylorswift_cover"))
        HomeViewController.songLists.append(Songs(songTitle: "Marry Me", songArtists: "Jason Derulo", songTrack: "Jason Derulo - Marry Me", songCover: "jasonderulo_cover"))
        HomeViewController.songLists.append(Songs(songTitle: "Chandelier", songArtists: "Sia", songTrack: "Sia - Chandelier", songCover: "sia_cover"))
        
        HomeViewController.songLists.append(Songs(songTitle: "Chrono Navi Jingle", songArtists: "Hoyoverse", songTrack: "Chrono Navi Jingle", songCover: "Chrono Navi Jingle Cover"))
        HomeViewController.songLists.append(Songs(songTitle: "Heart of Iron", songArtists: "Counter Side", songTrack: "Heart Of Iron", songCover: "Heart Of Iron Cover"))
        HomeViewController.songLists.append(Songs(songTitle: "Mercury Calling", songArtists: "Hand Shakers", songTrack: "Mercury Calling", songCover: "Mercury Calling Cover"))
        HomeViewController.songLists.append(Songs(songTitle: "Narwhal", songArtists: "Kuro", songTrack: "Narwhal", songCover: "Narwhal Cover"))
        HomeViewController.songLists.append(Songs(songTitle: "Oracle", songArtists: "Hoyoverse", songTrack: "Oracle", songCover: "Oracle Cover"))
        
        HomeViewController.songLists.append(Songs(songTitle: "대취타 (Daechwita)", songArtists: "SUGA", songTrack: "Agust D – Daechwita", songCover: "cover suga"))
        HomeViewController.songLists.append(Songs(songTitle: "Love Scenario", songArtists: "iKON", songTrack: "iKON - Love Scenario", songCover: "cover ikon"))
        HomeViewController.songLists.append(Songs(songTitle: "Hype Boy", songArtists: "New Jeans", songTrack: "NewJeans - Hype Boy", songCover: "cover newjeans"))
        HomeViewController.songLists.append(Songs(songTitle: "Psycho", songArtists: "Red Velvet", songTrack: "Red Velvet - Psycho", songCover: "cover rv"))
        HomeViewController.songLists.append(Songs(songTitle: "Feel Special", songArtists: "TWICE", songTrack: "TWICE - Feel Special", songCover: "cover twice"))
    }
    
    func addPlaylists() {
        HomeViewController.playLists.append(Playlists(playlistTitle: "Andy's Playlists", playlistSongs: [HomeViewController.songLists[0], HomeViewController.songLists[1], HomeViewController.songLists[2], HomeViewController.songLists[3], HomeViewController.songLists[4]], playlistCover: "andys_playlist"))
        HomeViewController.playLists.append(Playlists(playlistTitle: "Ronald's Playlists", playlistSongs: [HomeViewController.songLists[5], HomeViewController.songLists[6], HomeViewController.songLists[7], HomeViewController.songLists[8], HomeViewController.songLists[9]], playlistCover: "ronald_playlist"))
       HomeViewController.playLists.append(Playlists(playlistTitle: "Samuel's Playlists", playlistSongs: [HomeViewController.songLists[10], HomeViewController.songLists[11], HomeViewController.songLists[12], HomeViewController.songLists[13], HomeViewController.songLists[14]], playlistCover: ""))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addSongs()
        addPlaylists()
    }


}

