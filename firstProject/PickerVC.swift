//
//  PickerVC.swift
//  firstProject
//
//  Created by 김태양 on 2023/09/07.
//

import UIKit

class PickerVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    let MAX_ARRAY_NUM = 5
    let PICKER_VIEW_COLUMN = 2
    let PICKER_VIEW_HEIGHT: CGFloat = 100
    var imageArray = [UIImage]()
    var imageFileName = ["icon_document.png", "icon_heart.png", "icon_respiration.png", "icon_setting.png", "icon_siren.png"]
    
    @IBOutlet weak var pickerImage: UIPickerView! {
        didSet {
            pickerImage.delegate = self
            pickerImage.dataSource = self
        }
    }
    @IBOutlet weak var lblImageFileName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        for i in 0 ..< MAX_ARRAY_NUM {
            let image = UIImage(named:  imageFileName[i])
            imageArray.append(image!)
        }
        
        lblImageFileName.text = "Selected Item: " + imageFileName[0]
        imageView.image = imageArray[0]
    }
    
    // 피커 뷰의 컴포넌트 수 설정
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    // 피커 뷰의 개수 설정
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count
    }
    
    // 피커 뷰의 각 Row view 설정
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image: imageArray[row])
        imageView.frame = CGRectMake(0, 0, 100, 150)
        
        return imageView
    }
    
    // 피커 뷰의 각Row 타이틀 설정
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int,
//                    forComponent component: Int) -> String? {
//        return imageFileName[row]
//    }
    
    //피커 뷰가 선택되었을 때 실행
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(component == 0) {
            lblImageFileName.text = "Selected Item: " + imageFileName[row]
        } else {
            imageView.image = imageArray[row]
        }
    }
    
    // 피커 뷰의 높이 설정
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return PICKER_VIEW_HEIGHT
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
