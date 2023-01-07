//
//  PlaylistSectionTableViewCell.swift
//  msPlay-Project
//
//  Created by prk on 07/01/23.
//

import UIKit

class PlaylistSectionTableViewCell: UITableViewCell {
    
    @IBOutlet var ivSongCover: UIImageView!
    @IBOutlet var tvSongTitle: UILabel!
    @IBOutlet var tvSongArtist: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
