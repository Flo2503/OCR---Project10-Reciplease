//
//  RecipesTableViewCell.swift
//  Reciplease
//
//  Created by Flo on 01/02/2020.
//  Copyright © 2020 Flo. All rights reserved.
//

import UIKit

class SetUpCells: UITableViewCell {

    // MARK: - Instance
    private let webService = EdamamWebService()

    // MARK: - Outlets
    @IBOutlet weak var totalTimeCell: UILabel!
    @IBOutlet weak var likesCell: UILabel!
    @IBOutlet weak var titleCell: UILabel!
    @IBOutlet weak var subtitleCell: UILabel!
    @IBOutlet weak var imageCell: UIImageView!

    // MARK: - Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    //// Allow to display image in cels
    private func configureImage(image: UIImage) {
        imageCell.image = image
    }

    /// Allow to display information in cells
    func configure(title: String, subtitle: String, likes: Int, totaTime: Int) {
        titleCell.text = title
        subtitleCell.text = subtitle
        totalTimeCell.text = "\(String(totaTime))m"
        likesCell.text = "\(String(likes))"
    }

    /// Network call to load image for cells
    func imageForCells(url: String) {
        webService.getImage(url: url, callback: { (image) in
            DispatchQueue.main.async {
                if let image = image {
                    self.configureImage(image: image)
                }
            }
        })
    }
}
