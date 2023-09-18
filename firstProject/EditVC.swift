//
//  EditVC.swift
//  firstProject
//
//  Created by 김태양 on 2023/09/15.
//

import UIKit

protocol EditDelegate {
    func didMessageEditDone(controller: EditVC, message: String)
    func didImageOnOffDone(controller: EditVC, isOn: Bool)
}

class EditVC: UIViewController {

    var textWayValue: String = ""
    var textMessage: String = ""
    var delegate: EditDelegate?
    var isOn = false
    
    @IBOutlet weak var lblWay: UILabel!
    @IBOutlet weak var txMessage: UITextField!
    @IBOutlet weak var swIsOn: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblWay.text = textWayValue
        txMessage.text = textMessage
        swIsOn.isOn = isOn
    }
    
    @IBAction func swImageOnOff(_ sender: UISwitch) {
        if sender.isOn {
            isOn = true
        } else {
            isOn = false
        }
    }
    
    @IBAction func btnBarDone(_ sender: UIBarButtonItem) {
        if delegate != nil {
            delegate?.didMessageEditDone(controller: self, message: txMessage.text!)
            delegate?.didImageOnOffDone(controller: self, isOn: isOn)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnDone(_ sender: UIButton) {
        if delegate != nil {
            delegate?.didMessageEditDone(controller: self, message: txMessage.text!)
            delegate?.didImageOnOffDone(controller: self, isOn: isOn)
        }
        self.navigationController?.popViewController(animated: true)
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
