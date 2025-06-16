//
//  WebView.swift
//  webWrapper
//
//  Created by CS Prasad on 16/06/25.
//

import SwiftUI
import WebKit

struct WebView: View {
    @ObservedObject var viewModel: WebViewModel
    let url: URL

    var body: some View {
#if os(macOS)
        MacWebView(viewModel: viewModel, url: url)
#else
        iOSWebView(viewModel: viewModel, url: url)
#endif
    }
}

#if os(iOS)
struct iOSWebView: UIViewRepresentable {
    @ObservedObject var viewModel: WebViewModel
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        viewModel.webView.load(URLRequest(url: url))
        return viewModel.webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}
}
#elseif os(macOS)
struct MacWebView: NSViewRepresentable {
    @ObservedObject var viewModel: WebViewModel
    let url: URL

    func makeNSView(context: Context) -> WKWebView {
        viewModel.webView.load(URLRequest(url: url))
        return viewModel.webView
    }

    func updateNSView(_ nsView: WKWebView, context: Context) {}
}
#endif
