//
//  ViewController.swift
//  msPlay-Project
//
//  Created by Andy Salim on 07/12/22.
//

import UIKit

class HomeViewController: UIViewController
//                           , UITableViewDelegate, UITableViewDataSource
{
    
    public static var songLists = [Songs]()
    public static var playLists = [Playlists]()
    public static var currPlay = Songs(songTitle: "", songArtists: "", songTrack: "", songCover: "")
    
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
        
        HomeViewController.songLists.append(Songs(songTitle: "How You Like That", songArtists: "BLACKPINK", songTrack: "BLACKPINK - How You Like That", songCover: "cover blackpink"))
        HomeViewController.songLists.append(Songs(songTitle: "Ditto", songArtists: "NewJeans", songTrack: "NewJeans - Ditto", songCover: "cover ditto"))
        HomeViewController.songLists.append(Songs(songTitle: "Hype Boy", songArtists: "NewJeans", songTrack: "NewJeans - Hype Boy", songCover: "cover newjeans"))
        HomeViewController.songLists.append(Songs(songTitle: "Psycho", songArtists: "Red Velvet", songTrack: "Red Velvet - Psycho", songCover: "cover rv"))
        HomeViewController.songLists.append(Songs(songTitle: "Feel Special", songArtists: "TWICE", songTrack: "TWICE - Feel Special", songCover: "cover twice"))
    }
    
    func addPlaylists() {
        HomeViewController.playLists.append(Playlists(playlistTitle: "Andy's Playlists", playlistSongs: [HomeViewController.songLists[0], HomeViewController.songLists[1], HomeViewController.songLists[2], HomeViewController.songLists[3], HomeViewController.songLists[4]], playlistCover: "andys_playlist"))
        HomeViewController.playLists.append(Playlists(playlistTitle: "Ronald's Playlists", playlistSongs: [HomeViewController.songLists[5], HomeViewController.songLists[6], HomeViewController.songLists[7], HomeViewController.songLists[8], HomeViewController.songLists[9]], playlistCover: "ronald_playlist"))
       HomeViewController.playLists.append(Playlists(playlistTitle: "Samuel's Playlists", playlistSongs: [HomeViewController.songLists[10], HomeViewController.songLists[11], HomeViewController.songLists[12], HomeViewController.songLists[13], HomeViewController.songLists[14]], playlistCover: ""))
    }
    
    @IBOutlet weak var tbvHomeSection: UITableView!
    
//    var homeContent = [Content]()
//    func addContent() {
//        homeContent.append(Content(sectTitle: "Recently Played", sectSongImage1: "", sectSongTitle1: "", sectSongImage2: "", sectSongTitle2: "", sectSongImage3: "", sectSongTitle3: ""))
//        homeContent.append(Content(sectTitle: "Recommended Songs", sectSongImage1: "", sectSongTitle1: "", sectSongImage2: "", sectSongTitle2: "", sectSongImage3: "", sectSongTitle3: ""))
//        homeContent.append(Content(sectTitle: "Top Playlists", sectSongImage1: "ronald_playlist", sectSongTitle1: "Ronald's Playlist", sectSongImage2: "samuel_playlist", sectSongTitle2: "Samuel's PLaylist", sectSongImage3: "andys_playlist", sectSongTitle3: "Andy's Playlist"))
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addSongs()
        addPlaylists()
        
//        tbvHomeSection.delegate = self
//        tbvHomeSection.dataSource = self
    }
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 3
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tbvHomeSection.dequeueReusableCell(withIdentifier: "homeCell") as! HomeTableViewCell
//        cell.lblSectionTitle.text = homeContent[indexPath.row].sectTitle
//        cell.ivImage1.image = UIImage(named: homeContent[indexPath.row].sectSongImage1)
//        cell.lblTitle1.text = homeContent[indexPath.row].sectSongTitle1
//        cell.ivImage2.image = UIImage(named: homeContent[indexPath.row].sectSongImage2)
//        cell.lblTitle2.text = homeContent[indexPath.row].sectSongTitle2
//        cell.ivImage3.image = UIImage(named: homeContent[indexPath.row].sectSongImage3)
//        cell.lblTitle3.text = homeContent[indexPath.row].sectSongTitle3
//
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 205
//    }

}

//struct Content {
//    var sectTitle: String = ""
//    var sectSongImage1: String = ""
//    var sectSongTitle1: String = ""
//    var sectSongImage2: String = ""
//    var sectSongTitle2: String = ""
//    var sectSongImage3: String = ""
//    var sectSongTitle3: String = ""
//}

