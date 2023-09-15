//
//  NavigationVC.swift
//  firstProject
//
//  Created by 김태양 on 2023/09/15.
//

import UIKit

class NavigationVC: UIViewController, EditDelegate {

    @IBOutlet weak var txMessage: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as? EditVC
        if segue.identifier == "editButton" {
            editViewController?.textWayValue = "segue : Use button"
        } else if segue.identifier == "editBarButton" {
            editViewController?.textWayValue = "segue : Use Bar button"
        }
        editViewController?.delegate = self
    }
    
    func didMessageEditDone(controller: EditVC, message: String) {
        txMessage.text = message
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
