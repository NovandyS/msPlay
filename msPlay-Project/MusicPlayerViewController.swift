//
//  MusicPlayerViewController.swift
//  msPlay-Project
//
//  Created by Andy Salim on 06/01/23.
//

import AVFoundation
import UIKit

class MusicPlayerViewController: UIViewController, AVAudioPlayerDelegate {
    
    @IBOutlet weak var ivSong: UIImageView!
    @IBOutlet weak var tvSongTitle: UILabel!
    @IBOutlet weak var tvSongArtist: UILabel!
    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var trackSlider: UISlider!
    @IBOutlet weak var btnRepeat: UIButton!
    @IBOutlet weak var btnShuffle: UIButton!
    
    
//    public var position: Int = 0
    
    var player = AVAudioPlayer()
    let songCount = HomeViewController.songLists.count
    var currSong = HomeViewController.currPlay
    var repSong: Bool = false
    var shuffSong: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("\(player.isPlaying)")
    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        if animated{
//            player.pause()
//        }
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if player.isPlaying{
//            ivSong.image = UIImage(named: currSong.songCover)
//            tvSongTitle.text = currSong.songTitle
//            tvSongArtist.text = currSong.songArtists
//
//            trackSlider.value = Float(player.currentTime)
            
//            print("\(player.isPlaying)")
        }
        else {
            playTheMusic()
        }
    }
    
    func playTheMusic(){
        ivSong.image = UIImage(named: currSong.songCover)
        tvSongTitle.text = currSong.songTitle
        tvSongArtist.text = currSong.songArtists
        btnPlay.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        
        player.delegate = self
        
        let songURL = Bundle.main.path(forResource: currSong.songTrack, ofType: "mp3")
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)

            player = try AVAudioPlayer(contentsOf: URL(filePath: songURL!))
            HomeViewController.currPlay = currSong
            trackSlider.maximumValue = Float(player.duration)
            player.play()

        } catch {
            print("Sound can't be played!")
        }

        var _ = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(sliderUpdated), userInfo: nil, repeats: true)
    }
    
    @IBAction func sliderDragged(_ sender: Any) {
        let val = trackSlider.value
        player.stop()
        player.currentTime = TimeInterval(val)
        player.prepareToPlay()
        player.play()
    }
    
    @objc func sliderUpdated(){
        trackSlider.value = Float(player.currentTime)
    }
    
    @IBAction func playTapped(_ sender: Any) {
        if (player.isPlaying){
//            print("\(player.isPlaying)")
            player.pause()
            btnPlay.setImage(UIImage(systemName: "play.fill"), for: .normal)
        }
        else {
            player.play()
            btnPlay.setImage(UIImage(systemName: "pause.fill"), for: .normal)
            
        }
    }
    
    @IBAction func backTapped(_ sender: Any) {
        var currIndex = HomeViewController.songLists.firstIndex(of: HomeViewController.currPlay)
        
        if currIndex! > 0 {
            currIndex = currIndex! - 1
            player.stop()
            currSong = HomeViewController.songLists[currIndex!]
            playTheMusic()
        }
    }
    
    @IBAction func nextTapped(_ sender: Any) {
        var currIndex = HomeViewController.songLists.firstIndex(of: HomeViewController.currPlay)
        
        if currIndex! < songCount - 1 {
            if shuffSong == true {
                var randIndex = currIndex!
                while randIndex == currIndex {
                    randIndex = Int(arc4random_uniform(UInt32(songCount)))
                }
                player.stop()
                currSong = HomeViewController.songLists[randIndex]
                playTheMusic()
            }
            else {
                currIndex = currIndex! + 1
                player.stop()
                currSong = HomeViewController.songLists[currIndex!]
                playTheMusic()
            }
        }
    }
    
    @IBAction func repeatTapped(_ sender: Any) {
        if repSong == false {
            repSong = true
            btnRepeat.tintColor = UIColor(red: 0, green: 200, blue: 150, alpha: 1.000)
            player.numberOfLoops = -1
            
        }
        else {
            repSong = false
            btnRepeat.tintColor = UIColor.white
            player.numberOfLoops = 0
        }
    }
    
    @IBAction func shuffleTapped(_ sender: Any) {
        if shuffSong == false {
            shuffSong = true
            btnShuffle.tintColor = UIColor(red: 0, green: 200, blue: 150, alpha: 1.000)
        }
        else {
            shuffSong = false
            btnShuffle.tintColor = UIColor.white
        }
    }
    
    func audioPlayerDidFinishPlaying(_ _player: AVAudioPlayer, successfully flag: Bool) {
        if flag {
            var currIndex = HomeViewController.songLists.firstIndex(of: HomeViewController.currPlay)
            
            if currIndex! < songCount - 1 {
                if shuffSong == true {
                    var randIndex = currIndex!
                    while randIndex == currIndex {
                        randIndex = Int(arc4random_uniform(UInt32(songCount)))
                    }
                    player.stop()
                    currSong = HomeViewController.songLists[randIndex]
                    playTheMusic()
                }
                else {
                    currIndex = currIndex! + 1
                    player.stop()
                    currSong = HomeViewController.songLists[currIndex!]
                    playTheMusic()
                }
            }
        }
    }
    
}
