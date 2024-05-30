//
//  BrownViewController.swift
//  SeSacWeek3
//
//  Created by Minjae Kim on 5/29/24.
//

import UIKit

class BrownViewController: UIViewController {

    static let identifier = "BrownViewController"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "브라운"
    }
    
    // present - dismiss
    @IBAction func dismissButtonClicked(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    // push - pop
    @IBAction func popButtonClicked(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
