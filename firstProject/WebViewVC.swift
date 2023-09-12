//
//  WebViewVC.swift
//  firstProject
//
//  Created by 김태양 on 2023/09/11.
//

import UIKit
import WebKit

class WebViewVC: UIViewController, WKNavigationDelegate {

    
    @IBOutlet weak var txtUrl: UITextField!
    @IBOutlet weak var myWebView: WKWebView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    func loadWebPage(url: String) {
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        myWebView.load(myRequest)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myWebView?.navigationDelegate = self
        loadWebPage(url: "https://www.naver.com/")
        // Do any additional setup after loading the view.
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        indicator.startAnimating()
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        indicator.stopAnimating()
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        indicator.stopAnimating()
    }
    
    func checkUrl(url: String) -> String {
        var strUrl = url
        let flag = strUrl.hasPrefix("http://")
        if !flag {
            strUrl = "http://" + strUrl
        }
        return strUrl
    }

    @IBAction func btnGotoUrl(_ sender: Any) {
        let myUrl = checkUrl(url: txtUrl.text!)
        loadWebPage(url: myUrl)
    }
    @IBAction func btnGoSite1(_ sender: Any) {
        loadWebPage(url: "https://google.com")
    }
    
    @IBAction func btnGoSite2(_ sender: Any) {
        loadWebPage(url: "https://developer.android.com/")
    }
    
    @IBAction func btnLoadHtmlString(_ sender: Any) {
        let htmlString = "<h1> HTML String </h1><p> String 변수를 이용한 웹 페이지 </p><p><a href=\"http://naver.com\"> naver</a>으로 이동</p>"
        myWebView.loadHTMLString(htmlString, baseURL: nil)
    }
    
    @IBAction func btnStop(_ sender: Any) {
        myWebView.stopLoading()
    }
    
    @IBAction func btnReload(_ sender: Any) {
        myWebView.reload()
    }
    
    @IBAction func btnGoBack(_ sender: Any) {
        myWebView.goBack()
    }
    
    @IBAction func btnGoForward(_ sender: Any) {
        myWebView.goForward()
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
