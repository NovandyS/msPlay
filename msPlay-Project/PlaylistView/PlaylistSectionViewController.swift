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
    
    var selectedPList = Playlists(playlistTitle: "", playlistSongs: [], playlistCover: "")
    public var position: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tbvPlaylistSect.delegate = self
        tbvPlaylistSect.dataSource = self
        tvPlaylistTitle.text = selectedPList.playlistTitle
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return selectedPList.playlistSongs.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbvPlaylistSect.dequeueReusableCell(withIdentifier: "playSectCell") as! PlaylistSectionTableViewCell
        
        cell.ivSongCover.image = UIImage(named: selectedPList.playlistSongs[indexPath.section].songCover)
        cell.tvSongTitle.text = selectedPList.playlistSongs[indexPath.section].songTitle
        cell.tvSongArtist.text = selectedPList.playlistSongs[indexPath.section].songArtists
        
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
        
        HomeViewController.currPlay = selectedPList.playlistSongs[indexPath.section]
        
        let destination = storyboard?.instantiateViewController(withIdentifier: "mPlayer") as! MusicPlayerViewController
        present(destination, animated: true)
    }
    

}
