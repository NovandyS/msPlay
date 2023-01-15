//
//  CurrentlyPlayingViewContainer.swift
//  msPlay-Project
//
//  Created by Andy Salim on 11/01/23.
//

import UIKit

class CurrentlyPlayingViewContainer: UIViewController {

    @IBOutlet var currentPlayingView: UIView!
    @IBOutlet weak var lblSongTitle: UILabel!
    @IBOutlet var ivSongCover: UIImageView!
    @IBOutlet var lblSongArtist: UILabel!
    
    @IBOutlet weak var btnPlay: UIButton!
    
    var currSong = HomeViewController.currPlay
    var mHelper = MusicHelper.sharedHelper
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
    }
    
    override func viewWillAppear(_ animated: Bool) {
        var _ = Timer.scheduledTimer(timeInterval: 0.1, target: self , selector: #selector(viewUpdated), userInfo: nil, repeats: true)
    }
    
    @objc func viewUpdated() {
        currSong = HomeViewController.currPlay
        
        lblSongTitle.text = currSong.songTitle
        lblSongArtist.text = currSong.songArtists
        ivSongCover.image = UIImage(named: currSong.songCover)
        
        if mHelper.checkMusicPlaying(){
            btnPlay.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        }
        else {
            btnPlay.setImage(UIImage(systemName: "play.fill"), for: .normal)
        }
    }
    
    @IBAction func playTapped(_ sender: Any) {
        if mHelper.checkMusicPlaying(){
            mHelper.pauseBackgroundMusic()
            btnPlay.setImage(UIImage(systemName: "play.fill"), for: .normal)
        }
        else {
            mHelper.resumeBackgroundMusic()
            btnPlay.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first != nil {
            HomeViewController.currPlay = currSong
            
            let destination = storyboard?.instantiateViewController(withIdentifier: "mPlayer") as! MusicPlayerViewController
            HomeViewController.currPlayingBar = 1
            show(destination, sender: self)
        }
    }

}
