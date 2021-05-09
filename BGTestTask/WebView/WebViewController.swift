//
//  WebViewController.swift
//  BGTestTask
//
//  Created by Alexey Hvesko on 09.05.2021.
//

import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    //MARK: - Properties
    var url: URL!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let webViewURL = url
        
        view.addSubview(webView)
        webView.navigationDelegate = self
        webView.addSubview(activity)
        webView.load(URLRequest(url: webViewURL!))
        activity.hidesWhenStopped = true
    }
    
}

// MARK: - Dismiss
extension WebViewController {
    @IBAction func dismiss(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

// MARK: - Manage indicator
extension WebViewController {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        activity.startAnimating()
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!)  {
        activity.stopAnimating()
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error)  {
        activity.stopAnimating()
    }
    
}
