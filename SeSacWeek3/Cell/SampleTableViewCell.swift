//
//  SampleTableViewCell.swift
//  SeSacWeek3
//
//  Created by Minjae Kim on 5/28/24.
//

import UIKit
import Kingfisher

class SampleTableViewCell: UITableViewCell {

    static let identifier = "SampleTableViewCell"

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var reviewImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentLabel.font = .boldSystemFont(ofSize: 15)
        contentLabel.numberOfLines = 0
        contentLabel.textColor = .systemBrown
        
        profileImageView.backgroundColor = .systemTeal
        profileImageView.contentMode = .scaleAspectFill
        
        reviewImageView.backgroundColor = .systemTeal
        reviewImageView.contentMode = .scaleAspectFill
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
    }
    
    // 'root view의 sub view를 다시 그려줘' 라고 요청하는 메서드
    override func layoutSubviews() {
        super.layoutSubviews()
        
        reviewImageView.layer.cornerRadius = reviewImageView.frame.width / 2
    }
    
    // 재사용 하는 시점에 내가 원하는 것을
    // 준비해줘 라고 요청하는 메서드
    override func prepareForReuse() {
        super.prepareForReuse()
        
        backgroundColor = .systemBackground
        reviewImageView.image = nil
    }
    
    public func configureCell(_ data: Travel) {
        contentLabel.text = data.titleDescription
        
        if data.ad {
            backgroundColor = .systemYellow
        }
        
        let url = URL(string: data.travel_image ?? "")
        profileImageView.kf.indicatorType = .activity
        profileImageView.kf.setImage(with: url)
        reviewImageView.kf.indicatorType = .activity
        reviewImageView.kf.setImage(with: url)
    }
}
