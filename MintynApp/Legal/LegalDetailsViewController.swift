//
//  LegalDetailsViewController.swift
//  MintynApp
//
//  Created by Emmanuel Omokagbo on 10/11/2021.
//

import UIKit
import WebKit

class LegalDetailsViewController: UIViewController {
    
    // MARK: - Properties
    
    var webView: WKWebView!
    
    var url = ""
    
    var optionTitle = ""

    // MARK: - ViewControllerLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        webView = WKWebView()
        view = webView
        webView.navigationDelegate = self
        webView.allowsBackForwardNavigationGestures = true
        presentWebView()
    }
    
    // MARK: - Methods
    
    public func presentWebView() {
        guard let url = URL(string: self.url) else { return }
        webView.load(URLRequest(url: url))
    }
}

// MARK: - WKNavigationDelegate

extension LegalDetailsViewController: WKNavigationDelegate {}
