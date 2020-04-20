//
//  FavoriteTableViewCell.swift
//  Reciplease
//
//  Created by Flo on 08/02/2020.
//  Copyright © 2020 Flo. All rights reserved.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {

    // MARK: - Oulets
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var totalTimeFavoriteCell: UILabel!
    @IBOutlet weak var likesFavoriteCell: UILabel!
    @IBOutlet weak var titleFavoriteCell: UILabel!
    @IBOutlet weak var subtitleFavoriteCell: UILabel!
    @IBOutlet weak var imageFavoriteCell: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setUp()
    }

    // MARK: - Methods
    /// Allow tio diplay information in cells
    func configure(title: String, subtitle: String, likes: Int, totaTime: Int) {
        titleFavoriteCell.text = title
        subtitleFavoriteCell.text = subtitle
        totalTimeFavoriteCell.text = "\(String(totaTime))m"
        likesFavoriteCell.text = "\(String(likes))"
    }

    //// Allow to display image in cels
    func configureImage(image: UIImage) {
        imageFavoriteCell.image = image
    }

    private func setUp() {
        self.infoView.layer.cornerRadius = 7
        self.infoView.layer.borderWidth = 2
        self.infoView.layer.borderColor = UIColor(red: 222/255, green: 225/255, blue: 227/255, alpha: 1).cgColor
    }
}
