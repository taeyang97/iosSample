//
//  WebViewVC.swift
//  firstProject
//
//  Created by 김태양 on 2023/09/11.
//

import UIKit
import WebKit

class WebViewVC: UIViewController, UIWebViewDelegate {

    
    @IBOutlet weak var txtUrl: UITextField!
    @IBOutlet weak var myWebView: WKWebView!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    
    func loadWebPage(url: String) {
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        myWebView.load(myRequest)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadWebPage(url: "https://www.naver.com/")
        // Do any additional setup after loading the view.
    }

    @IBAction func btnGotoUrl(_ sender: Any) {
        
    }
    @IBAction func btnGoSite1(_ sender: Any) {
    }
    
    @IBAction func btnGoSite2(_ sender: Any) {
    }
    
    @IBAction func btnLoadHtmlString(_ sender: Any) {
    }
    
    @IBAction func btnLoadHtmlFile(_ sender: Any) {
    }
    
    @IBAction func btnStop(_ sender: Any) {
    }
    
    @IBAction func btnReload(_ sender: Any) {
    }
    
    @IBAction func btnGoBack(_ sender: Any) {
    }
    
    @IBAction func btnGoForward(_ sender: Any) {
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
