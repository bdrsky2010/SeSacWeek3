//
//  SearchViewController.swift
//  SeSacWeek3
//
//  Created by Minjae Kim on 5/28/24.
//

import UIKit

class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView("검색 화면")
        
        // BarButtonItem 클릭 -> 코드로 MapViewController Push
        configureNvigationBar()
    }
}

extension SearchViewController {
    private func configureNvigationBar() {
        let leftBarButton = UIBarButtonItem(image: UIImage(systemName: "map.fill"),
                                            style: .plain,
                                            target: self,
                                            action: #selector(leftBarButtonAction))
        
        navigationItem.leftBarButtonItem = leftBarButton
    }
    
    @objc
    private func leftBarButtonAction() {
        let identifier = MapViewController.identifier
        let vc = storyboard?.instantiateViewController(withIdentifier: identifier) as! MapViewController
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
