//
//  WebView.swift
//  State Managment
//
//  Created by Heeral Jain on 11/6/22.
//

import SwiftUI
import Foundation
import WebKit

struct WebView: UIViewRepresentable {
    let urlString: String?
        
        func makeUIView(context: Context) -> WKWebView {
            return WKWebView()
        }
        
        func updateUIView(_ uiView: WKWebView, context: Context) {
            if let safeString = urlString {
                if let url = URL(string: safeString) {
                    let request = URLRequest(url: url)
                    uiView.load(request)
                }
            }
        }
}
