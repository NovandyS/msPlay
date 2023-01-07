//
//  PlaylistTableViewCell.swift
//  msPlay-Project
//
//  Created by prk on 07/01/23.
//

import UIKit

class PlaylistTableViewCell: UITableViewCell {
    
    @IBOutlet var tvPlaylistTitle: UILabel!
    @IBOutlet var tvPlaylistNumofSongs: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
