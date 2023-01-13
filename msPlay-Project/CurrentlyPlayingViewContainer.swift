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
    @IBOutlet weak var btnPlay: UIButton!
    
    var player = MusicPlayerViewController.musicPlayer
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblSongTitle.text = HomeViewController.currPlay.songTitle

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first != nil {
            let destination = storyboard?.instantiateViewController(withIdentifier: "mPlayer") as! MusicPlayerViewController
            show(destination, sender: self)
        }
    }

}
