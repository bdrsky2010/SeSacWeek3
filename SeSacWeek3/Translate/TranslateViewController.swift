//
//  TranslateViewController.swift
//  SeSacWeek3
//
//  Created by Minjae Kim on 5/30/24.
//

import UIKit

class TranslateViewController: UIViewController {

    @IBOutlet weak var originalTextView: UITextView!
    @IBOutlet weak var translateButton: UIButton!
    @IBOutlet weak var resultTextView: UITextView!
    
    private let placeholder = "번역하고 싶은 문자를 입력해주세요"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        originalTextView.text = placeholder
        originalTextView.textColor = .systemGray
        
        // 둘 중 하나만 delegate로 기능 구현을 하고 싶다면
        // 1. 한 쪽에 대한 delegate 연결을 하지 않거나
        // 2. 내부 매개 변수 명을 활용 하지 않기 / Outlet 변수명으로 조건 처리하기
        originalTextView.delegate = self
        resultTextView.delegate = self
    }
}

extension TranslateViewController: UITextViewDelegate {
    
    // 텍스트뷰 텍스트 크기가 변경될 때마다 호출
    func textViewDidChange(_ textView: UITextView) {
        
        print(textView.text ?? "")
    }
    
    // 편집 시작, 커서 깜빡임
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        if textView == originalTextView,
           textView.text == placeholder,
           textView.textColor == UIColor.systemGray {
            
            textView.text = nil
            originalTextView.textColor = .label
        }
    }
    
    // 편집 끝, 커서 안깜빡임
    func textViewDidEndEditing(_ textView: UITextView) {
        
        if textView == originalTextView,
           textView.text.isEmpty {
            
            textView.text = placeholder
            originalTextView.textColor = .systemGray
        }
    }
}
