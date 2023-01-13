//
//  HomeTableViewCell.swift
//  msPlay-Project
//
//  Created by Andy Salim on 11/01/23.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblSectionTitle: UILabel!
    @IBOutlet weak var ivImage1: UIImageView!
    @IBOutlet weak var lblTitle1: UILabel!
    @IBOutlet weak var ivImage2: UIImageView!
    @IBOutlet weak var lblTitle2: UILabel!
    @IBOutlet weak var ivImage3: UIImageView!
    @IBOutlet weak var lblTitle3: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
