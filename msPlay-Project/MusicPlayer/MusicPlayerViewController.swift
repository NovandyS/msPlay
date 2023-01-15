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
    
    var mHelper = MusicHelper.sharedHelper
    let songCount = HomeViewController.songLists.count
    var currSong = HomeViewController.currPlay
    var repSong = HomeViewController.repeatFlag
    var shuffSong = HomeViewController.shuffleFlag
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if HomeViewController.currPlayingBar == 1{
            ivSong.image = UIImage(named: currSong.songCover)
            tvSongTitle.text = currSong.songTitle
            tvSongArtist.text = currSong.songArtists
            if (mHelper.checkMusicPlaying()){
                btnPlay.setImage(UIImage(systemName: "pause.fill"), for: .normal)
            }
            
            trackSlider.maximumValue = mHelper.getMusicDuration()
            var _ = Timer.scheduledTimer(timeInterval: 0.1, target: self , selector: #selector(sliderUpdated), userInfo: nil, repeats: true)
            
            HomeViewController.currPlayingBar = 0
        } else {
            playTheMusic()
        }
        
//        Set shuffle image color
        if shuffSong == true {
            btnShuffle.tintColor = UIColor(red: 0, green: 200, blue: 150, alpha: 1.000)
        }
        else {
            btnShuffle.tintColor = UIColor.white
        }
        
//        Set repeat image color
        if repSong == true {
            btnRepeat.tintColor = UIColor(red: 0, green: 200, blue: 150, alpha: 1.000)
        }
        else {
            btnRepeat.tintColor = UIColor.white
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        HomeViewController.currPlay = currSong
    }
    
    func playTheMusic(){
        print("\(currSong.songTitle)")
        
        ivSong.image = UIImage(named: currSong.songCover)
        tvSongTitle.text = currSong.songTitle
        tvSongArtist.text = currSong.songArtists
        btnPlay.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        
        mHelper.playBackgroundMusic(track: currSong.songTrack)
        mHelper.musicPlayer.delegate = self
        
        var indexFounded = HomeViewController.homeData[0].sectionContent.firstIndex(where: {$0?.songTitle == currSong.songTitle})
        if !HomeViewController.homeData[0].sectionContent.contains(where: {$0?.songTitle == currSong.songTitle}) {
            print("No same song detected")
            HomeViewController.homeData[0].sectionContent.insert(currSong, at: 0)
        }
        else if HomeViewController.homeData[0].sectionContent.contains(where: {$0?.songTitle == currSong.songTitle}) &&  indexFounded != 0{
            print("Same song detected but not in the first place")
            HomeViewController.homeData[0].sectionContent.remove(at: indexFounded!)
            HomeViewController.homeData[0].sectionContent.insert(currSong, at: 0)
        }

        trackSlider.maximumValue = mHelper.getMusicDuration()
        var _ = Timer.scheduledTimer(timeInterval: 0.1, target: self , selector: #selector(sliderUpdated), userInfo: nil, repeats: true)
    }
    
    @IBAction func sliderDragged(_ sender: Any) {
        let val = trackSlider.value
        mHelper.changeSliderMusic(value: val)
    }
    
    @objc func sliderUpdated(){
        trackSlider.value = mHelper.getCurrentTimeMusic()
    }
    
    @IBAction func playTapped(_ sender: Any) {
        if (mHelper.checkMusicPlaying()){
            mHelper.pauseBackgroundMusic()
            btnPlay.setImage(UIImage(systemName: "play.fill"), for: .normal)
        }
        else {
            mHelper.resumeBackgroundMusic()
            btnPlay.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        }
    }
    
    @IBAction func backTapped(_ sender: Any) {
        var currIndex = HomeViewController.songLists.firstIndex(of: currSong)

        if currIndex! > 0 {
            currIndex = currIndex! - 1
            currSong = HomeViewController.songLists[currIndex!]
            HomeViewController.currPlay = currSong
            playTheMusic()
        }
    }
    
    @IBAction func nextTapped(_ sender: Any) {
        var currIndex = HomeViewController.songLists.firstIndex(of: currSong)
        
        if shuffSong == true {
            var randIndex = currIndex!
            while randIndex == currIndex {
                randIndex = Int(arc4random_uniform(UInt32(songCount)))
            }
            mHelper.stopBackgroundMusic()
            currSong = HomeViewController.songLists[randIndex]
            HomeViewController.currPlay = currSong
            playTheMusic()
        }
        else {
            if currIndex! < songCount - 1 {
                currIndex = currIndex! + 1
                mHelper.stopBackgroundMusic()
                currSong = HomeViewController.songLists[currIndex!]
                HomeViewController.currPlay = currSong
                playTheMusic()
            }
            else {
                btnPlay.setImage(UIImage(systemName: "play.fill"), for: .normal)
            }
        }
    }
    
    @IBAction func repeatTapped(_ sender: Any) {
        if repSong == false {
            HomeViewController.repeatFlag = true
            repSong = true
            btnRepeat.tintColor = UIColor(red: 0, green: 200, blue: 150, alpha: 1.000)
            mHelper.repeatMusic(flag: repSong)
        }
        else {
            HomeViewController.repeatFlag = false
            repSong = false
            btnRepeat.tintColor = UIColor.white
            mHelper.repeatMusic(flag: repSong)
        }
    }
    
    @IBAction func shuffleTapped(_ sender: Any) {
        if shuffSong == false {
            HomeViewController.shuffleFlag = true
            shuffSong = true
            btnShuffle.tintColor = UIColor(red: 0, green: 200, blue: 150, alpha: 1.000)
        }
        else if shuffSong == true {
            HomeViewController.shuffleFlag = false
            shuffSong = false
            btnShuffle.tintColor = UIColor.white
        }
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if flag == true {
            var currIndex = HomeViewController.songLists.firstIndex(of: currSong)

            if shuffSong == true {
                var randIndex = currIndex!
                while randIndex == currIndex {
                    randIndex = Int(arc4random_uniform(UInt32(songCount)))
                }
                mHelper.stopBackgroundMusic()
                currSong = HomeViewController.songLists[randIndex]
                HomeViewController.currPlay = currSong
                playTheMusic()
            }
            else {
                if currIndex! < songCount - 1 {
                    currIndex = currIndex! + 1
                    mHelper.stopBackgroundMusic()
                    currSong = HomeViewController.songLists[currIndex!]
                    HomeViewController.currPlay = currSong
                    playTheMusic()
                }
                else {
                    btnPlay.setImage(UIImage(systemName: "play.fill"), for: .normal)
                }
            }
        }
    }
    
}
