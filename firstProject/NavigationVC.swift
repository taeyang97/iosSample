//
//  NavigationVC.swift
//  firstProject
//
//  Created by 김태양 on 2023/09/15.
//

import UIKit

class NavigationVC: UIViewController, EditDelegate {

    let imgOn = UIImage(systemName: "lightbulb.fill")
    let imgOff = UIImage(systemName: "lightbulb")
    
    var isOn = true
    
    @IBOutlet weak var txMessage: UITextField!
    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imgView.image = imgOn
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditVC
        if segue.identifier == "editButton" {
            editViewController.textWayValue = "segue : Use button"
        } else if segue.identifier == "editBarButton" {
            editViewController.textWayValue = "segue : Use Bar button"
        }
        editViewController.textMessage = txMessage.text!
        editViewController.isOn = isOn
        editViewController.delegate = self
    }
    
    func didMessageEditDone(controller: EditVC, message: String) {
        txMessage.text = message
    }
    
    func didImageOnOffDone(controller: EditVC, isOn: Bool) {
        if isOn {
            imgView.image = imgOn
            self.isOn = true
        } else {
            imgView.image = imgOff
            self.isOn = false
        }
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
