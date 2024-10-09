//
//  SermonDetailView.swift
//  ibblb_new
//
//  Created by jovani Hernandez on 10/1/24.
//

import SwiftUI
import AVKit  // Import AVKit for video playback

struct SermonDetailView: View {
    let sermon: Sermon  // The selected sermon

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(sermon.title)
                    .font(.largeTitle)
                    .padding(.bottom, 5)

                Text("Speaker: \(sermon.pastorName)")
                    .font(.title2)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 10)

                Text(sermon.description)
                    .font(.body)
                    .padding(.bottom, 20)

                // Video Player (if video URL is present)
                if let videoURL = sermon.videoURL {
                    VideoPlayer(player: AVPlayer(url: videoURL))
                        .frame(height: 250)
                        .cornerRadius(10)
                        .padding(.bottom, 20)
                }

                // Audio Player Button (if audio URL is present)
                if let audioURL = sermon.audioURL {
                    Button(action: {
                        playAudio(url: audioURL)  // Play the audio
                    }) {
                        HStack {
                            Image(systemName: "headphones.circle")
                                .font(.title)
                            Text("Listen to Audio")
                                .font(.headline)
                        }
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                }
            }
            .padding()
        }
        .navigationTitle(sermon.title)
    }
    
    func playAudio(url: URL) {
        // Handle audio playback logic here
    }
}
