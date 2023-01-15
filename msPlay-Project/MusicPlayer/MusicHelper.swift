//
//  MusicHelper.swift
//  msPlay-Project
//
//  Created by Andy Salim on 14/01/23.
//

import AVFoundation

class MusicHelper {
    static let sharedHelper = MusicHelper()
    var musicPlayer = HomeViewController.audioPlayer
    
    func playBackgroundMusic(track: String) {
        let audio = URL(filePath: Bundle.main.path(forResource: track, ofType: "mp3")!)
        do {
            musicPlayer = try AVAudioPlayer(contentsOf: audio)
            musicPlayer.prepareToPlay()
            musicPlayer.play()
        } catch {
            print("Sound can't be played")
        }
    }
    
    func stopBackgroundMusic() {
        musicPlayer.stop()
    }
    
    func pauseBackgroundMusic() {
        musicPlayer.pause()
    }
    
    func resumeBackgroundMusic() {
        musicPlayer.play()
    }
    
    func checkMusicPlaying() -> Bool {
        return musicPlayer.isPlaying
    }
    
    func musicFinishPlaying(endofSong: Float, shuffleSong: Bool) {
        if endofSong == getMusicDuration(){
            if shuffleSong == true {
                
            }
        }
    }
    
    func changeSliderMusic(value: Float) {
        musicPlayer.stop()
        musicPlayer.currentTime = TimeInterval(value)
        musicPlayer.prepareToPlay()
        musicPlayer.play()
    }
    
    func repeatMusic(flag: Bool) {
        if flag == true {
            musicPlayer.numberOfLoops = -1
        }
        else {
            musicPlayer.numberOfLoops = 0
        }
    }
    
    func getMusicDuration() -> Float {
        return Float(musicPlayer.duration)
    }
    
    func getCurrentTimeMusic() -> Float {
        return Float(musicPlayer.currentTime)
    }
    
}
