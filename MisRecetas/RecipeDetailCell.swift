//
//  RecipeDetailCell.swift
//  MisRecetas
//
//  Created by Smart Geeks on 16/6/17.
//  Copyright © 2017 SmartGeeks. All rights reserved.
//

import UIKit

class RecipeDetailCell: UITableViewCell {

    @IBOutlet var keyLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
