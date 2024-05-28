//
//  HomeViewController.swift
//  SeSacWeek3
//
//  Created by Minjae Kim on 5/28/24.
//

import UIKit
/*
 1. tableView 아웃렛 선언
 2. UITableViewDelegate, UITableViewDataSource
 3. 
 */
class HomeViewController: UIViewController,
                          UITableViewDelegate,
                          UITableViewDataSource {

    @IBOutlet weak var usetTextField: UITextField!
    @IBOutlet weak var firstFilterButton: UIButton!
    @IBOutlet weak var secondFilterButton: UIButton!
    @IBOutlet weak var thirdFilterButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    lazy var buttonList = [
        firstFilterButton, secondFilterButton, thirdFilterButton
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureView("홈 화면")
        configureTableView()
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        let xib = UINib(nibName: SampleTableViewCell.identifier, bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: SampleTableViewCell.identifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = SampleTableViewCell.identifier
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! SampleTableViewCell
        return cell
    }
}
