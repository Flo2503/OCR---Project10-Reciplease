//
//  RecipesTableViewCell.swift
//  Reciplease
//
//  Created by Flo on 01/02/2020.
//  Copyright © 2020 Flo. All rights reserved.
//

import UIKit

class UniverselTableViewCell: UITableViewCell {

    private let webService = EdamamWebService()

    // MARK: - Outlets
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var totalTimeCell: UILabel!
    @IBOutlet weak var likesCell: UILabel!
    @IBOutlet weak var titleCell: UILabel!
    @IBOutlet weak var subtitleCell: UILabel!
    @IBOutlet weak var imageCell: UIImageView!

    // MARK: - Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        setUp()
    }

    /// Allow tio diplay information in cells
    func configure(title: String, subtitle: String, likes: Int, totaTime: Int) {
        titleCell.text = title
        subtitleCell.text = subtitle
        totalTimeCell.text = "\(String(totaTime))m"
        likesCell.text = "\(String(likes))"
    }

    //// Allow to display image in cels
    func configureImage(image: UIImage) {
        imageCell.image = image
    }

    func imageForCells(url: String) {
        webService.getImage(url: url, callback: { (image) in
            DispatchQueue.main.async {
                if let image = image {
                    self.configureImage(image: image)
                }
            }
        })
    }

    private func setUp() {
        self.infoView.layer.cornerRadius = 7
        self.infoView.layer.borderWidth = 2
        self.infoView.layer.borderColor = UIColor(red: 222/255, green: 225/255, blue: 227/255, alpha: 1).cgColor
    }
}
