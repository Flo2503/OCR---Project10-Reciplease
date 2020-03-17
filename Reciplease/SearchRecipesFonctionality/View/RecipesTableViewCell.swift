//
//  RecipesTableViewCell.swift
//  Reciplease
//
//  Created by Flo on 01/02/2020.
//  Copyright © 2020 Flo. All rights reserved.
//

import UIKit

class RecipesTableViewCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var totalTimeRecipesCell: UILabel!
    @IBOutlet weak var likesRecipesCell: UILabel!
    @IBOutlet weak var titleRecipesCell: UILabel!
    @IBOutlet weak var subtitleRecipesCell: UILabel!
    @IBOutlet weak var imageRecipesCell: UIImageView!
    
// MARK: - Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        setUp()
    }
    
    /// Allow tio diplay information in cells
    func configure(title: String, subtitle: String, likes: Int, totaTime: Int) {
        titleRecipesCell.text = title
        subtitleRecipesCell.text = subtitle
        totalTimeRecipesCell.text = "\(String(totaTime))m"
        likesRecipesCell.text = "\(String(likes))"
    }
    
    //// Allow to display image in cels
    func configureImage(image: UIImage) {
        imageRecipesCell.image = image
    }
     
    private func setUp() {
        self.infoView.layer.cornerRadius = 7
        self.infoView.layer.borderWidth = 2
        self.infoView.layer.borderColor = UIColor(red:222/255, green:225/255, blue:227/255, alpha: 1).cgColor
    }
    
}
