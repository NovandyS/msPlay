//
//  BrowseTableViewCell.swift
//  msPlay-Project
//
//  Created by Andy Salim on 06/01/23.
//

import UIKit

class BrowseTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ivSongCover: UIImageView!
    @IBOutlet weak var tvSongTitle: UILabel!
    @IBOutlet weak var tvSongArtist: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
