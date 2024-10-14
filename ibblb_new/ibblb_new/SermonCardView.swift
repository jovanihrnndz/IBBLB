//
//  SermonCardView.swift
//  ibblb_new
//
//  Created by jovani Hernandez on 10/1/24.
//
import SwiftUI

struct SermonCardView: View {
    let sermon: Sermon
    
    var body: some View {
        VStack(alignment: .leading) {
            // Display YouTube Thumbnail if video URL is available
            if let videoURL = sermon.videoURL, let thumbnailURL = getYouTubeThumbnailURL(videoURL: videoURL) {
                
                // Wrap AsyncImage with NavigationLink
                NavigationLink(destination: SermonDetailView(sermon: sermon)) {
                    AsyncImage(url: thumbnailURL) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 200)
                                .cornerRadius(10)
                        } else if phase.error != nil {
                            // Error placeholder
                            Image(systemName: "exclamationmark.triangle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 200)
                                .foregroundColor(.red)
                        } else {
                            // Placeholder while loading
                            ProgressView()
                                .frame(height: 200)
                        }
                    }
                }
                .buttonStyle(PlainButtonStyle())  // Ensure the link doesn't take the button style
                
            } else {
                // Fallback if no video or thumbnail available
                Text("No video available")
                    .foregroundColor(.gray)
                    .frame(height: 200)
            }

            // Sermon Title
            Text(sermon.title)
                .font(.headline)
                .padding(.top, 8)
        }
        .padding()
    }
}

// Place this function at the bottom or top of SermonCardView.swift
private func getYouTubeThumbnailURL(videoURL: URL) -> URL? {
    let urlString = videoURL.absoluteString

    // Check if the URL is in the embedded format
    if urlString.contains("embed/") {
        // Extract video ID from embedded URL
        guard let videoID = urlString.components(separatedBy: "embed/").last else {
            return nil
        }
        
        // Construct the thumbnail URL using the video ID
        let thumbnailURLString = "https://img.youtube.com/vi/\(videoID)/hqdefault.jpg"
        return URL(string: thumbnailURLString)
    } else if urlString.contains("v=") {
        // Extract video ID from standard YouTube URL
        guard let videoID = urlString.components(separatedBy: "v=").last else {
            return nil
        }
        
        // Construct the thumbnail URL using the video ID
        let thumbnailURLString = "https://img.youtube.com/vi/\(videoID)/hqdefault.jpg"
        return URL(string: thumbnailURLString)
    }

    return nil
}
