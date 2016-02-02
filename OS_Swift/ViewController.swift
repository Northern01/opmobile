//
//  ViewController.swift
//  OS_Swift
//
//  Created by li, Chaoqing on 2/1/16.
//  Copyright © 2016 Bruce Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    @IBOutlet weak var labMessage: UILabel!
    
    @IBOutlet weak var txtInput: UITextField!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url = NSURL(string: "http://rshankar.com")
        let request = NSURLRequest(URL: url!)
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
    
    @IBAction func GOClicked(sender: AnyObject) {
        let str = txtInput.text
        let url = NSURL(string: str!)
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
    }
    
    
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool{
    
        
        return true
    }
    func webViewDidStartLoad(webView: UIWebView){
        labMessage.text = "Loading ---- " + (webView.request?.URL?.absoluteString)!
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }

    
    func webViewDidFinishLoad(webView: UIWebView){
        labMessage.text = "Finish ---- " + (webView.request?.URL?.absoluteString)!
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }

    func webView(webView: UIWebView, didFailLoadWithError error: NSError?){
        labMessage.text = "Load fail ---- " + (webView.request?.URL?.absoluteString)! + " ---- " + (error?.localizedDescription)!
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }

}

