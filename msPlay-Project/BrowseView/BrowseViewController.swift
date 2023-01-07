//
//  BrowseViewController.swift
//  msPlay-Project
//
//  Created by Andy Salim on 28/12/22.
//

import UIKit

class BrowseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tvSongs: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tvSongs.delegate = self
        tvSongs.dataSource = self
    }
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return HomeViewController.songLists.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tvSongs.dequeueReusableCell(withIdentifier: "browseCell") as! BrowseTableViewCell
        cell.ivSongCover.image = UIImage(named: HomeViewController.songLists[indexPath.section].songCover)
        cell.tvSongTitle.text = HomeViewController.songLists[indexPath.section].songTitle
        cell.tvSongArtist.text = HomeViewController.songLists[indexPath.section].songArtists
        
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
