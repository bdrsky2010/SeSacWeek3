//
//  SampleTableViewCell.swift
//  SeSacWeek3
//
//  Created by Minjae Kim on 5/28/24.
//

import UIKit

class SampleTableViewCell: UITableViewCell {

    static let identifier = "SampleTableViewCell"

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var reviewImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
