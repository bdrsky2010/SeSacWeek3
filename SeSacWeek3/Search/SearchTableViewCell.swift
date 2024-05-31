//
//  SearchTableViewCell.swift
//  SeSacWeek3
//
//  Created by Minjae Kim on 5/31/24.
//

import UIKit

final class SearchTableViewCell: UITableViewCell {
    
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        posterImageView.backgroundColor = .systemIndigo
        posterImageView.layer.cornerRadius = 20
        posterImageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
        posterImageView.contentMode = .scaleAspectFill
        
        contentLabel.backgroundColor = .systemOrange
        contentLabel.layer.cornerRadius = 20
        
        // clipsToBounds vs masksToBounds
        contentLabel.clipsToBounds = true
    }

    public func configureCell(_ data: Travel) {
        
        if let image = data.travel_image {
            let url = URL(string: image)
            posterImageView.kf.setImage(with: url)
        } else {
            posterImageView.image = UIImage(systemName: "star")
        }
        
        contentLabel.text = data.description
        
    }
}
