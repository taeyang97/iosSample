//
//  DatePickerVC.swift
//  firstProject
//
//  Created by 김태양 on 2023/09/06.
//

import UIKit

class DatePickerVC: UIViewController {

    let timeSelector: Selector = #selector(DatePickerVC.updateTime)
    let interval = 1.0
    var count = 0
    var alarmTime: String = ""

    @IBOutlet weak var currentTime: UILabel!
    @IBOutlet weak var pickerTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    
        // Do any additional setup after loading the view.
    }
    

    @IBAction func changeDataPicker(_ sender: UIDatePicker) {
        let dataPickerView = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        
        let alarmFormatter = DateFormatter()
        alarmFormatter.dateFormat = "HH:mm aaa"
        
        alarmTime = alarmFormatter.string(from: dataPickerView.date)
        pickerTime.text = "선택시간: " + formatter.string(from: dataPickerView.date)
    }
    
    @objc func updateTime() {
        let date = Date()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        
        let alarmFormatter = DateFormatter()
        alarmFormatter.dateFormat = "HH:mm aaa"
        let alarmCurrentTime = alarmFormatter.string(from: date)
        
        currentTime.text = "현재시간: " + formatter.string(from: date)
        
        if(alarmTime == alarmCurrentTime) {
            view.backgroundColor = UIColor.red
        } else {
            view.backgroundColor = UIColor.white
        }
        
    }
    
}
