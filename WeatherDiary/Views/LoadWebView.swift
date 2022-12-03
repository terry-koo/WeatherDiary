//
//  LoadWebView.swift
//  WeatherDiary
//
//  Created by KiWoong Hong on 2022/12/03.
//

import SwiftUI
import WebKit

struct LoadWebView: UIViewRepresentable {
    
    let urlToLoad: String = "https://weatherkit.apple.com/legal-attribution.html"
    
    func makeUIView(context: Context) -> WKWebView {
        guard let url = URL(string: self.urlToLoad) else {
            return WKWebView()
    }
        let webview = WKWebView()
        webview.load(URLRequest(url: url))
        
        return webview
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
    }
}
