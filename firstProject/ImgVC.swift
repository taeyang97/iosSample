//
//  FirstViewController.swift
//  firstProject
//
//  Created by 김태양 on 2023/09/06.
//

import UIKit

class ImgVC: UIViewController {

    var imageName = ["folder", "folder.fill", "trash", "trash.fill"]
    var image: UIImage?
    var id = 0

    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        image = UIImage(systemName: "folder")
        imgView.image = image
    }
 
    @IBAction func nextPageBtn(_ sender: Any) {
        if id < 3 {
            id = id + 1
        }
        image = UIImage(systemName: imageName[id])
        imgView.image = image
    }
    
    @IBAction func backPageBtn(_ sender: Any) {
        if id > 0 {
            id = id - 1
        }
        image = UIImage(systemName: imageName[id])
        imgView.image = image
    }
    
}
