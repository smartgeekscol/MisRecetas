//
//  FullRecipeCell.swift
//  MisRecetas
//
//  Created by Smart Geeks on 14/6/17.
//  Copyright © 2017 SmartGeeks. All rights reserved.
//

import UIKit

class FullRecipeCell: UITableViewCell {

    @IBOutlet var imageViewFullCell: UIImageView!
    @IBOutlet var nameLabelFullCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
