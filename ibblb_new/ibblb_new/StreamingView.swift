//
//  StreamingView.swift
//  ibblb_new
//
//  Created by jovani Hernandez on 10/1/24.
import SwiftUI
import WebKit

struct StreamingView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()  // Create a WebView instance
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)  // Load the URL
        webView.load(request)
    }
}

struct StreamingViewContainer: View {
    let url: URL

    var body: some View {
        VStack(spacing: 0) {
            // Add the banner at the top
            BannerView()

            // Add the WebView for streaming content
            StreamingView(url: url)
                .edgesIgnoringSafeArea(.bottom)  // Make sure the streaming covers the screen
        }
        .edgesIgnoringSafeArea(.top)  // Ensure the banner and webview fill the top area
    }
}

struct StreamingView_Previews: PreviewProvider {
    static var previews: some View {
        StreamingViewContainer(url: URL(string: "https://www.youtube.com/watch?v=7XExAC2R1Ts")!)
    }
}
