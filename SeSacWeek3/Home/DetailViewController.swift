//
//  DetailViewController.swift
//  SeSacWeek3
//
//  Created by Minjae Kim on 5/29/24.
//

import UIKit

class DetailViewController: UIViewController {

    static let identifier = "DetailViewController"
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var gradeLabel: UILabel!
    
    // Pass Data 1. 데이터를 받을 공간(프로퍼티) 생성
    public var data: Travel?
    public var contents: String = "상세 화면"
    public var descriptionContents: String = ""
    public var gradeAndSave: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Pass Data 3. 전달 받은 값을 뷰에다가 표현!
        guard let data else { return }
        navigationItem.title = data.title
        
        descriptionLabel.text = data.description
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 0
        
        gradeLabel.text = data.titleDescription
        gradeLabel.textAlignment = .center
        gradeLabel.numberOfLines = 0
    }
    


}
