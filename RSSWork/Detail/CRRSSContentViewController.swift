//
//  CRRSSContentViewController.swift
//  RSSWork
//
//  Created by weihao on 2021/11/4.
//

import Foundation
import WebKit

class CRRSSContentViewController: UIViewController {
    
    var webView : WKWebView!,
        config : WKWebViewConfiguration!
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: Setup UI
    private func setupUI() {
        config = WKWebViewConfiguration()
        webView = WKWebView(frame: self.view.bounds, configuration: config)
        view.addSubview(webView)
    }
    
    // MARK: Public
    public func loadRequest(URL url: String!) {
        if url.count <= 0 { return }
        guard let requestUrl = URL(string: url) else {
            return
        }
        webView.load(URLRequest(url: requestUrl))
    }
    
    
}
