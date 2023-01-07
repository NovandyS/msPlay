//
//  MusicPlayerViewController.swift
//  msPlay-Project
//
//  Created by Andy Salim on 06/01/23.
//

import AVFoundation
import UIKit

class MusicPlayerViewController: UIViewController {
    
    @IBOutlet weak var ivSong: UIImageView!
    @IBOutlet weak var tvSongTitle: UILabel!
    @IBOutlet weak var tvSongArtist: UILabel!
    
    public var position: Int = 0
    
    var musicPlayer = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let currSong = HomeViewController.songLists[position]
        
        ivSong.image = UIImage(named: currSong.songCover)
        tvSongTitle.text = currSong.songTitle
        tvSongArtist.text = currSong.songArtists
        
        let songURL = Bundle.main.path(forResource: currSong.songTrack, ofType: "mp3")
        do {
//            try AVAudioSession.sharedInstance().setMode(.default)
//            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            
            musicPlayer = try AVAudioPlayer(contentsOf: URL(filePath: songURL!))
            
            musicPlayer.play()
            
        } catch {
            print("Sound can't be played!")
        }
        
    }

}
