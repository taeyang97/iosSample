//
//  PageControlVC.swift
//  firstProject
//
//  Created by 김태양 on 2023/09/13.
//

import UIKit

class PageControlVC: UIViewController {

    var images = ["pencil", "pencil.circle", "pencil.circle.fill", "pencil.slash", "pencil.line"]
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.green
        pageControl.currentPageIndicatorTintColor = UIColor.red
        imgView.image = UIImage(systemName: images[0])
    }
    
    
    @IBAction func pageChanged(_ sender: Any) {
        imgView.image = UIImage(systemName: images[pageControl.currentPage])
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
