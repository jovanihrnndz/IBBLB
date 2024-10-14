//
//  SermonDetailView.swift
//  ibblb_new
//
//  Created by jovani Hernandez on 10/1/24.
//

import SwiftUI
import AVKit
import WebKit

struct SermonDetailView: View {
    let sermon: Sermon  // The selected sermon
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                // YouTube Video Player - Placed at the top
                if let videoURL = sermon.videoURL {
                    WebView(url: videoURL)
                        .frame(height: 250)
                        .cornerRadius(10)
                        .padding(.bottom, 20)
                } else {
                    Text("No video available for this sermon")
                        .foregroundColor(.gray)
                }
                
                // Pastor's Name (after the video)
                Text("Pastor: \(sermon.pastorName)")
                    .font(.title2)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 10)
            }
            .padding()
        }
        .navigationTitle(sermon.pastorName) // Changed to display the pastor's name as the title
    }
}

// WebView for embedding YouTube videos
struct WebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
