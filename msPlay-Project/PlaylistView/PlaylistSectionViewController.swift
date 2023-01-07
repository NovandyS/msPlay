//
//  PlaylistSectionViewController.swift
//  msPlay-Project
//
//  Created by prk on 07/01/23.
//

import UIKit

class PlaylistSectionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tbvPlaylistSect: UITableView!
    @IBOutlet var tvPlaylistTitle: UILabel!
    
    public var position: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tbvPlaylistSect.delegate = self
        tbvPlaylistSect.dataSource = self
        tvPlaylistTitle.text = HomeViewController.playLists[position].playlistTitle
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return HomeViewController.playLists[position].playlistSongs.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbvPlaylistSect.dequeueReusableCell(withIdentifier: "playSectCell") as! PlaylistSectionTableViewCell
        
        let currPlaylist = HomeViewController.playLists[position]
        cell.ivSongCover.image = UIImage(named: currPlaylist.playlistSongs[indexPath.section].songCover)
        cell.tvSongTitle.text = currPlaylist.playlistSongs[indexPath.section].songTitle
        cell.tvSongArtist.text = currPlaylist.playlistSongs[indexPath.section].songArtists
        
        cell.layer.cornerRadius = 15
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerV = UIView()
        headerV.backgroundColor = UIColor.clear
        return headerV
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let pos = indexPath.section
        
        let destination = storyboard?.instantiateViewController(withIdentifier: "mPlayer") as! MusicPlayerViewController
        destination.position = pos
        present(destination, animated: true)
    }
    

}
