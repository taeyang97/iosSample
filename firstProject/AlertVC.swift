//
//  AlertVC.swift
//  firstProject
//
//  Created by 김태양 on 2023/09/08.
//

import UIKit

class AlertVC: UIViewController {

    let imgOn : UIImage = UIImage(systemName: "lightbulb.fill")!
    let imgOff : UIImage = UIImage(systemName: "lightbulb")!
    let imgRemove : UIImage = UIImage(systemName: "trash")!
    var isLampOn = true
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageView.image = imgOn
    }
    
    @IBAction func btnLampOn(_ sender: Any) {
        if isLampOn {
            let lampOnAlert = UIAlertController(title: "경고", message: "현재 On 상태입니다", preferredStyle: .alert)
            let onAction = UIAlertAction(title: "네, 알겠습니다.", style: .default, handler: nil)
            lampOnAlert.addAction(onAction)
            present(lampOnAlert, animated: true, completion: nil)
        } else {
            imageView.image = imgOn
            isLampOn = true
        }
    }
    
    @IBAction func btnLampOff(_ sender: Any) {
        if isLampOn {
            let lampOffAlert = UIAlertController(title: "램프 끄기", message: "램프를 끄시겠습니까?", preferredStyle: .alert)
            let offAction = UIAlertAction(title: "네", style: .default, handler: {
                ACTION in self.imageView.image = self.imgOff
                self.isLampOn = false
            })
            let cancelAction = UIAlertAction(title: "아니오", style: .default, handler: nil)
            
            lampOffAlert.addAction(offAction)
            lampOffAlert.addAction(cancelAction)
            
            present(lampOffAlert, animated: true)
        }
    }
    
    @IBAction func btnLampRemove(_ sender: Any) {
        let lampRemoveAlert = UIAlertController(title: "램프 제거", message: "램프를 제거하시겠습니까?", preferredStyle: .alert)
        
        let offAction = UIAlertAction(title: "아니오, 끕니다(off)", style: .default, handler: {
            ACTION in self.imageView.image = self.imgOff
            self.isLampOn = false
        })
        
        let onAction = UIAlertAction(title: "아니오, 켭니다(on)", style: .default, handler: {
            ACTION in self.imageView.image = self.imgOn
            self.isLampOn = true
        })
        
        let removeAction = UIAlertAction(title: "네, 제거합니다.", style: .destructive, handler: {
            ACTION in self.imageView.image = self.imgRemove
            self.isLampOn = false
        })
        
        lampRemoveAlert.addAction(offAction)
        lampRemoveAlert.addAction(onAction)
        lampRemoveAlert.addAction(removeAction)
        present(lampRemoveAlert, animated: true)
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
