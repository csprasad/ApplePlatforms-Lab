//
//  WebViewModel.swift
//  webWrapper
//
//  Created by CS Prasad on 16/06/25.
//

import Foundation
import WebKit

class WebViewModel: ObservableObject {
    @Published var webView = WKWebView()

    func goBack() {
        if webView.canGoBack { webView.goBack() }
    }

    func goForward() {
        if webView.canGoForward { webView.goForward() }
    }

    func reload() {
        webView.reload()
    }
}
