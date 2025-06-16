//
//  ContentView.swift
//  webWrapper
//
//  Created by CS Prasad on 16/06/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = WebViewModel()
    private let pokiURL = URL(string: "https://poki.com/en/g/draw-wire")!

    var body: some View {
        VStack(spacing: 0) {
            WebView(viewModel: viewModel, url: pokiURL)
            Divider()
            HStack {
                Button("←") { viewModel.goBack() }
                Button("→") { viewModel.goForward() }
                Button("⟳") { viewModel.reload() }
            }
            .padding()
            .background(Color.gray.opacity(0.1))
        }
    }
}
