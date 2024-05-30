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
class HomeViewController: UIViewController {

    @IBOutlet weak var usetTextField: UITextField!
    @IBOutlet weak var firstFilterButton: UIButton!
    @IBOutlet weak var secondFilterButton: UIButton!
    @IBOutlet weak var thirdFilterButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    lazy var buttonList = [
        firstFilterButton, secondFilterButton, thirdFilterButton
    ]
    
    let list = TravelInfo.travel
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureView("홈 화면")
        configureTableView()
    }
}

// MARK: Configure TableView
extension HomeViewController {
    private func configureTableView() {
        tableView.rowHeight = UITableView.automaticDimension // 동적 cell height
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let xib = UINib(nibName: SampleTableViewCell.identifier, bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: SampleTableViewCell.identifier)
    }
}

// MARK: Configure UITableViewDelgate
extension HomeViewController: UITableViewDelegate {
    // 셀을 클릭했는데 동작을 안한다면?
    // - print로 확인
    // - delegate, dataSource = self 빠트리지 않았나
    // - 연결이 안되어 있거나
    // - 테이블뷰나 셀이 클릭이 되는 상태인지. interaction / selection
    // - 클릭되는 컨트롤 들이 위에 있는 상태인지
    // - 제스쳐 중첩: 만약 셀 클릭 + 셀에 탭 제스쳐, 테이블뷰 탭 제스쳐
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let index = indexPath.row
        let data = list[index]
        
        defer {
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        
        if data.ad {
            
            let sb = UIStoryboard(name: "Setting", bundle: nil)
            
            let identifier = BrownViewController.identifier
            let vc = sb.instantiateViewController(withIdentifier: identifier) as! BrownViewController
            
            present(vc, animated: true)
            
            return
        }
        
        // 같은 스토리보드 파일 내에 뷰컨트롤러로 전환을 할 때는 스토리보드를 안가져와도 된다.
        // let sb = UIStoryboard(name: "Home", bundle: nil)
        
        let identifier = DetailViewController.identifier
        let vc = storyboard?.instantiateViewController(withIdentifier: identifier) as! DetailViewController
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: Configure UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = SampleTableViewCell.identifier
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! SampleTableViewCell
        
        let index = indexPath.row
        let data = list[index]
        
        cell.configureCell(data)
        
        return cell
    }
}
