//
//  HomeTableViewCell.swift
//  msPlay-Project
//
//  Created by Andy Salim on 11/01/23.
//

import UIKit

class HomeTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var cvSectionContent: UICollectionView!
    
    var indexOfSection: Int = -1
    var rowSelected: ((_ dataToBePlayed: Songs) -> Void)? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cvSectionContent.delegate = self
        cvSectionContent.dataSource = self
        
        cvSectionContent.reloadData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return HomeViewController.homeData[indexOfSection].sectionContent.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let CVcell = collectionView.dequeueReusableCell(withReuseIdentifier: "cvCell", for: indexPath) as! HomeCollectionViewCell
        
        CVcell.ivCover.image = UIImage(named: HomeViewController.homeData[indexOfSection].sectionContent[indexPath.row]!.songCover)
        CVcell.lblTitle.text = HomeViewController.homeData[indexOfSection].sectionContent[indexPath.row]!.songTitle
        CVcell.lblArtist.text = HomeViewController.homeData[indexOfSection].sectionContent[indexPath.row]!.songArtists
        
        return CVcell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let thisSong = HomeViewController.homeData[indexOfSection].sectionContent[indexPath.row]!
        let currIndex = HomeViewController.songLists.firstIndex(where: {$0.songTitle == thisSong.songTitle})
        HomeViewController.currPlay = HomeViewController.songLists[currIndex!]
        
        let dataToBePlayed = HomeViewController.currPlay
        rowSelected?(dataToBePlayed)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 143)
        }

}
