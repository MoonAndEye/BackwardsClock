//
//  WebView.swift
//  BackwardsClock
//
//  Created by cm0679 on 2022/6/6.
//

import SwiftUI
import WebKit

struct BCWebView: View {
    
    @Environment(\.dismiss) var dismiss
    
    let urlString: String
    
    var dismissButton: some View {
        return DismissButtonBuilder
            .getDismissButton(action: dismiss, image: Image(systemName: "x.circle"))
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
            HStack {
                Spacer()
                dismissButton
                    .font(.system(size: 44))
                    .tint(.black)
                    .padding([.top, .trailing])
            }
            
            if let url = getURL(string: urlString) {
                WKWebViewContainer(url: url)
            } else {
                URLNotCorrectView()
            }
        }
    }
    
    func getURL(string: String) -> URL? {
        return URL(string: string)
    }
}

struct URLNotCorrectView: View {
    
    var body: some View {
        
        VStack {
            Image(systemName: "wifi.exclamationmark")
                .font(.system(size: 150))
                .padding()
            Text("Oops! Internet got error")
                .bold()
                .multilineTextAlignment(.center)
                .font(.system(size: 44))
        }
    }
}

struct WKWebViewContainer: UIViewRepresentable {
    
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
    
    static var urlString: String {
        "https://en.wikipedia.org/wiki/Grace_Hopper"
    }
    
    static var url: URL {
        URL(string: "https://en.wikipedia.org/wiki/Grace_Hopper")!
    }
    
    static var previews: some View {
//        BCWebView(url: url)
        BCWebView(urlString: urlString)
        URLNotCorrectView()
    }
}
