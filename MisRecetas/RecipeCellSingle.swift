//
//  RecipeCellSingle.swift
//  MisRecetas
//
//  Created by Smart Geeks on 14/6/17.
//  Copyright © 2017 SmartGeeks. All rights reserved.
//

import UIKit

class RecipeCellSingle: UITableViewCell {

    @IBOutlet var imageViewCellSingle: UIImageView!
    @IBOutlet var nameSingleLabel: UILabel!
    @IBOutlet var timeSingleLabel: UILabel!
    @IBOutlet var ingredientsSingleLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
