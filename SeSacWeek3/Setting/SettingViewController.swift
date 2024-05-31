//
//  SettingViewController.swift
//  SeSacWeek3
//
//  Created by Minjae Kim on 5/28/24.
//

import UIKit

final class SampleViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBrown
    }
}

final class SettingViewController: UIViewController {

    static let nicknameKey = "nickname"
    static let phoneKey = "phone"
    static let locationKey = "location"
    
    @IBOutlet weak var nicknameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    
    private let userDefaultsManager = UserDefaultsManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nicknameTextField.text = userDefaultsManager.nickname
        phoneTextField.text = userDefaultsManager.phone
        locationTextField.text = userDefaultsManager.location
        
        configureView("설정 화면")
    }
    
    @IBAction func saveButtonClicked(_ sender: UIButton) {
        userDefaultsManager.nickname = nicknameTextField.text ?? ""
        userDefaultsManager.phone = phoneTextField.text ?? ""
        userDefaultsManager.location = locationTextField.text ?? ""
    }
    
    @IBAction func presentModal(_ sender: UIButton) {
        // 코드만 가지고 오는 형태
        // let vc = SampleViewController()
        
        // 1. 스토리보드 가져오기
        let sb = UIStoryboard(name: "Setting", bundle: nil)
        
        // 2. 스토리보드 내 전환하고자 하는 화면 가져오기
        let identifier = BrownViewController.identifier
        let vc = sb.instantiateViewController(withIdentifier: identifier) as! BrownViewController
        
        // 3. 화면에 띄우기
        present(vc, animated: true)
    }
    
    @IBAction func presentFullScreenModal(_ sender: UIButton) {
        // 1. 스토리보드 가져오기
        let sb = UIStoryboard(name: "Setting", bundle: nil)
        
        // 2. 스토리보드 내 전환하고자 하는 화면 가져오기
        let identifier = BrownViewController.identifier
        let vc = sb.instantiateViewController(withIdentifier: identifier) as! BrownViewController
        
        // 2-1. 화면 옵션
        // fullScreen은 dismiss를 직접 구현해주어야 한다.
        vc.modalPresentationStyle = .fullScreen
        
        // 'Present 방식'에서 화면을 띄울 때 애니메이션
        // modalTransitionStyle 은 modalPresentationStyle 에 따라
        // 동작이 안되거나 런타임 이슈가 발생할 수도 있음.
        // modalTransitionStyle 은 push 전환 방식은 무관
        // vc.modalTransitionStyle = .flipHorizontal
        
        // 3. 화면에 띄우기
        present(vc, animated: true)
    }
    
    @IBAction func presentNavigationModal(_ sender: UIButton) {
        // 1. 스토리보드 가져오기
        let sb = UIStoryboard(name: "Setting", bundle: nil)
        
        // 2. 스토리보드 내 전환하고자 하는 화면 가져오기
        let identifier = BrownViewController.identifier
        let vc = sb.instantiateViewController(withIdentifier: identifier) as! BrownViewController
        
        // 2-1. 네비게이션 컨트롤러 임베드
        let nav = UINavigationController(rootViewController: vc)
        
        // modal 옵션 설정은 vc가 아닌 nav에 해줘야 함
        nav.modalPresentationStyle = .fullScreen
        
        // 3. 화면에 띄우기
        present(nav, animated: true)
    }
    
    @IBAction func pushShow(_ sender: UIButton) {
        // 1. 스토리보드 가져오기
        let sb = UIStoryboard(name: "Setting", bundle: nil)
        
        // 2. 스토리보드 내 전환하고자 하는 화면 가져오기
        let identifier = BrownViewController.identifier
        let vc = sb.instantiateViewController(withIdentifier: identifier) as! BrownViewController
        
        // 3. 화면에 띄우기
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
