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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        lblSongTitle.text = HomeViewController.currPlay.songTitle
        lblSongArtist.text = HomeViewController.currPlay.songArtists
        ivSongCover.image = UIImage(named: HomeViewController.currPlay.songCover)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first != nil {
            let destination = storyboard?.instantiateViewController(withIdentifier: "mPlayer") as! MusicPlayerViewController
            show(destination, sender: self)
        }
    }

}
