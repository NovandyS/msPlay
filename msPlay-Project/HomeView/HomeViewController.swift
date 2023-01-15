//
//  ViewController.swift
//  msPlay-Project
//
//  Created by Andy Salim on 07/12/22.
//
import AVFoundation
import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    static var audioPlayer = AVAudioPlayer()
    static var shuffleFlag = false
    static var repeatFlag = false
    static var currPlayingBar = 0
    
    static var songLists = [Songs]()
    static var playLists = [Playlists]()
    static var currPlay = Songs(songTitle: "", songArtists: "", songTrack: "", songCover: "")
    
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
       HomeViewController.playLists.append(Playlists(playlistTitle: "Samuel's Playlists", playlistSongs: [HomeViewController.songLists[10], HomeViewController.songLists[11], HomeViewController.songLists[12], HomeViewController.songLists[13], HomeViewController.songLists[14]], playlistCover: "samuel_playlist"))
    }
    
    static var homeData = [
        HomeData(sectionTitle: "Recently Played", sectionContent: [
            Songs(songTitle: "Love Story", songArtists: "Taylor Swift", songTrack: "Taylor Swift - Love Story", songCover: "taylorswift_cover"),
            Songs(songTitle: "Hype Boy", songArtists: "NewJeans", songTrack: "NewJeans - Hype Boy", songCover: "cover newjeans"),
            Songs(songTitle: "Heart of Iron", songArtists: "Counter Side", songTrack: "Heart Of Iron", songCover: "Heart Of Iron Cover")
        ]),
        HomeData(sectionTitle: "For You", sectionContent: [
            Songs(songTitle: "Ditto", songArtists: "NewJeans", songTrack: "NewJeans - Ditto", songCover: "cover ditto"),
            Songs(songTitle: "Oracle", songArtists: "Hoyoverse", songTrack: "Oracle", songCover: "Oracle Cover"),
            Songs(songTitle: "Chandelier", songArtists: "Sia", songTrack: "Sia - Chandelier", songCover: "sia_cover")
        ])
    ]
    
    @IBOutlet weak var tbvHomeSection: UITableView!
    
    var sectTitle = ["Recently Played", "For You"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addSongs()
        addPlaylists()
        
        tbvHomeSection.delegate = self
        tbvHomeSection.dataSource = self
        
        var _ = Timer.scheduledTimer(timeInterval: 1, target: self , selector: #selector(cellUpdated), userInfo: nil, repeats: true)
    }
    
    @objc func cellUpdated(){
        self.tbvHomeSection.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 165
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return HomeViewController.homeData.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return HomeViewController.homeData[section].sectionTitle
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell") as! HomeTableViewCell
        cell.indexOfSection = indexPath.section
        cell.rowSelected = { dataToBePlayed in
            let destination = self.storyboard?.instantiateViewController(withIdentifier: "mPlayer") as! MusicPlayerViewController
            self.present(destination, animated: true)
        }
        cell.cvSectionContent.reloadData()
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.backgroundColor = UIColor.clear
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.white
        header.textLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    }

}
