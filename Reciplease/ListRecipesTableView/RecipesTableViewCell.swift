//
//  RecipesTableViewCell.swift
//  Reciplease
//
//  Created by Flo on 01/02/2020.
//  Copyright © 2020 Flo. All rights reserved.
//

import UIKit

class RecipesTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }


    @IBOutlet weak var titleRecipesCell: UILabel!
    @IBOutlet weak var subtitleRecipesCell: UILabel!
    @IBOutlet weak var imageRecipesCell: UIImageView!
    
    func configure(image icon: String, title: String, subtitle: String) {
        imageRecipesCell.image = UIImage(named: icon)
        titleRecipesCell.text = title
        subtitleRecipesCell.text = subtitle
    }
    
    
}
