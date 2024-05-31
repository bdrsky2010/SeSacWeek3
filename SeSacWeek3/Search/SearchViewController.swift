//
//  SearchViewController.swift
//  SeSacWeek3
//
//  Created by Minjae Kim on 5/28/24.
//

import UIKit

final class SearchViewController: UIViewController {

    @IBOutlet weak var filterTableView: UITableView!
    @IBOutlet weak var contentsTableView: UITableView!
    
    private let filterOptionList = ["전체", "여행만", "광고만", "좋아요O만", "좋아요X만"]
    private let totalList = TravelInfo.travel
    
    // list가 바꾸면 테이블뷰는 항상 갱신
    // list가 100군데서 바뀌면 reloadData 코드가 100번 필요
    // list가 바뀌었을 때를 감지할 수 없을까? => 프로퍼티 옵저버.
    private var filteredList: [Travel] = TravelInfo.travel {
        didSet { // 바뀌고 나서
            contentsTableView.reloadData()
        }
        
        willSet { // 바뀌려고 할 때
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView("검색 화면")
        configureTableView()
        
        // BarButtonItem 클릭 -> 코드로 MapViewController Push
        configureNvigationBar()
    }
    
    private func configureTableView() {
        configurefilterTableView()
        configureContentsTableView()
    }
    
    private func configurefilterTableView() {
        filterTableView.delegate = self
        filterTableView.dataSource = self
        
        let nib = UINib(nibName: SearchTableViewCell.identifier, bundle: nil)
        filterTableView.register(nib, forCellReuseIdentifier: SearchTableViewCell.identifier)
        
    }
    
    private func configureContentsTableView() {
        contentsTableView.delegate = self
        contentsTableView.dataSource = self
        
        let nib = UINib(nibName: SearchTableViewCell.identifier, bundle: nil)
        contentsTableView.register(nib, forCellReuseIdentifier: SearchTableViewCell.identifier)
        
    }
}

extension SearchViewController {
    private func configureNvigationBar() {
        let leftBarButton = UIBarButtonItem(image: UIImage(systemName: "map.fill"),
                                            style: .plain,
                                            target: self,
                                            action: #selector(leftBarButtonAction))
        leftBarButton.tintColor = .systemBackground
        
        navigationItem.leftBarButtonItem = leftBarButton
    }
    
    @objc
    private func leftBarButtonAction() {
        let identifier = MapViewController.identifier
        let vc = storyboard?.instantiateViewController(withIdentifier: identifier) as! MapViewController
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func getTotal(){
        filteredList = totalList
    }
    
    private func getTravel(){
        filteredList = totalList.filter { !$0.ad }
    }
    
    private func getAd(){
        filteredList = totalList.filter { $0.ad }
    }
    
    private func getLikeO(){
        filteredList = totalList.filter { $0.like ?? false }
    }
    
    private func getLikeX(){
        filteredList = totalList.filter { !($0.like ?? false) }
    }
}

extension SearchViewController: UITableViewDelegate {
    
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == filterTableView {
            
            return filterOptionList.count
        }
        
        return filteredList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView == filterTableView {
            
            switch indexPath.row {
                
            case 0: getTotal()
            case 1: getTravel()
            case 2: getAd()
            case 3: getLikeO()
            case 4: getLikeX()
            default: print("error")
                
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = SearchTableViewCell.identifier
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! SearchTableViewCell
        
        let index = indexPath.row
        
        if tableView == filterTableView {
            let data = filterOptionList[index]
            cell.contentLabel.text = data
        } else {
            let data = filteredList[index]
            cell.configureCell(data)
        }
        
        return cell
    }
    
    
}
