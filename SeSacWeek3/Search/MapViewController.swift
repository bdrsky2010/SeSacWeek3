//
//  MapViewController.swift
//  SeSacWeek3
//
//  Created by Minjae Kim on 5/30/24.
//

import UIKit
import MapKit

// 변수의 생명주기(scope)
final class MapViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var mapView: MKMapView!
    
    private let picker = UIPickerView()
    private let list = ["영등포캠퍼스", "서울역", "경복궁", "광화문", "청와대"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.tintColor = .clear
        textField.inputView = picker
        
        picker.delegate = self
        picker.dataSource = self
        
        let center = CLLocationCoordinate2D(latitude: 37.517742, longitude: 126.886463)
        mapView.region = MKCoordinateRegion(center: center, latitudinalMeters: 500, longitudinalMeters: 500)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = center
        annotation.title = "새싹 영등포캠퍼스"
        mapView.addAnnotation(annotation)
        
        mapView.delegate = self
    }
}

// MARK: Configure UIPickerViewDelegate
extension MapViewController: UIPickerViewDelegate { }

// MARK: Configure UIPickerViewDataSource
extension MapViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        if component == 0 {
//            return 3
//        } else {
//            return 10
//        }
        return list.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return list[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textField.text = list[row]
    }
}

// MARK: Configure MKMapViewDelegate
extension MapViewController: MKMapViewDelegate {
    
    // any(Swift 5.6 등장) vs some(Swift 5.1 등장): Opaque Type
    func mapView(_ mapView: MKMapView, didSelect annotation: any MKAnnotation) {
        print(#function)
    }
    
    //  region
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        print(#function)
    }
}

// MARK: Configure UITextFieldDelegate
extension MapViewController: UITextFieldDelegate {
    
    // 자주 사용하는 메서드
    // did end on exit 과 동일
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // true: 기능을 넣고
        // false: 기능을 안넣고
        print("리턴키 클릭")
        view.endEditing(true)
        return true
    }
    
    // text 편집이 시작됐는지(커서가 깜빡이기 시작했는지)
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("편집 시작 | 커서가 깜빡이기 시작했는지")
    }
    
    // text 편집이 끝났는지(커서가 더이상 깜빡이지 않는지)
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("편집 끝 | 커서가 더이상 깜빡이지 않는지")
    }
}
