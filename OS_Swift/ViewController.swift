//
//  ViewController.swift
//  OS_Swift
//
//  Created by li, Chaoqing on 2/1/16.
//  Copyright © 2016 Bruce Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var webView: UIWebView!
    
    @IBOutlet weak var labMessage: UILabel!
    
    @IBOutlet weak var txtInput: UITextField!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.txtInput.delegate = self
        let url = URL(string: "https://www.google.com")
        let request = URLRequest(url: url!)
        webView.loadRequest(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func doRefresh(_: AnyObject) {
        webView.reload()
    }
    
    @IBAction func goBack(_: AnyObject) {
        webView.goBack()
    }
    
    @IBAction func goForward(_: AnyObject) {
        webView.goForward()
    }
    
    @IBAction func stop(_: AnyObject) {
        webView.stopLoading()
    }
    
    @IBAction func GOClicked(_ sender: AnyObject) {
        let str = txtInput.text
        let url = URL(string: str!)
        let request = URLRequest(url: url!)
        webView.stopLoading();
        webView.loadRequest(request)
    }
    
    @IBAction func doSearchZhuqiyu(_: AnyObject) {
        if(webView.request?.url?.absoluteString.contains("https://www.google.com"))!{
            webView.stringByEvaluatingJavaScript(from: "document.getElementsByName('q')[0].value='朱祁林';")
            webView.stringByEvaluatingJavaScript(from: "document.forms[0].submit(); ")
        }
    }

    
    
    func webView(_ webView: UIWebView, shouldStartLoadWithRequest request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool{
    
        
        return true
    }
    func webViewDidStartLoad(_ webView: UIWebView){
        labMessage.text = "Loading ---- " + (webView.request?.url?.absoluteString)!
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }

    
    func webViewDidFinishLoad(_ webView: UIWebView){
        labMessage.text = "Finish ---- " + (webView.request?.url?.absoluteString)!
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }

    func webView(_ webView: UIWebView, didFailLoadWithError error: NSError?){
        labMessage.text = "Load fail ---- " + (webView.request?.url?.absoluteString)! + " ---- " + (error?.localizedDescription)!
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.txtInput.resignFirstResponder()
        return true
    }

}

