//
//  WebView.swift
//  BackwardsClock
//
//  Created by cm0679 on 2022/6/6.
//

import SwiftUI
import WebKit

struct BCWebView: UIViewRepresentable {
    
    var url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}

struct WebView_Previews: PreviewProvider {
    
    static var url: URL {
        return URL(string: "https://en.wikipedia.org/wiki/Grace_Hopper")!
    }
    
    static var previews: some View {
        BCWebView(url: url)
    }
}
