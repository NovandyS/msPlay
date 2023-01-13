//
//  PlaylistViewController.swift
//  msPlay-Project
//
//  Created by Andy Salim on 28/12/22.
//

import UIKit

class PlaylistViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tvPlaylist: UITableView!
    
    var selectedPlaylist = Playlists(playlistTitle: "", playlistSongs: [], playlistCover: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tvPlaylist.delegate = self
        tvPlaylist.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return HomeViewController.playLists.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tvPlaylist.dequeueReusableCell(withIdentifier: "playlistCell") as! PlaylistTableViewCell
        cell.tvPlaylistTitle.text = HomeViewController.playLists[indexPath.section].playlistTitle
        cell.tvPlaylistNumofSongs.text = "\(HomeViewController.playLists[indexPath.section].playlistSongs.count) Song(s)"
        
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "playlistSect"{
            let destination = segue.destination as? PlaylistSectionViewController
            destination?.selectedPList = selectedPlaylist
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //-- Using Segue --//
        selectedPlaylist = HomeViewController.playLists[indexPath.section]
        self.performSegue(withIdentifier: "playlistSect", sender: selectedPlaylist)
    
    }
}
