//
//  PlaylistViewController.swift
//  msPlay-Project
//
//  Created by Andy Salim on 28/12/22.
//

import UIKit

class PlaylistViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tvPlaylist: UITableView!
    
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
        if segue.identifier == "showPlaySect"{
            let destination = segue.destination as! PlaylistSectionViewController
            let pos = tvPlaylist.indexPathForSelectedRow?.row
            destination.position = pos!
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
        
        let row = indexPath.section
        performSegue(withIdentifier: "showPlaySect", sender: cell)
    }
}
