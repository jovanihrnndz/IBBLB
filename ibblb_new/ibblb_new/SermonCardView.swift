//
//  SermonCardView.swift
//  ibblb_new
//
//  Created by jovani Hernandez on 10/1/24.
//
import SwiftUI

struct SermonCardView: View {
    var sermon: Sermon

    var body: some View {
        VStack(alignment: .leading) {
            Image(sermon.thumbnailName)
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width - 40, height: 200)
                .clipped()
                .cornerRadius(12)

            VStack(alignment: .leading, spacing: 4) {
                Text(sermon.title)
                    .font(.headline)

                Text("Speaker: \(sermon.pastorName)")
                    .font(.subheadline)
                    .foregroundColor(.gray)

                Text(sermon.description)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }
            .padding(.horizontal)
            .padding(.bottom, 10)
        }
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 4)
        .padding(.vertical, 8)
    }
}

struct SermonCardView_Previews: PreviewProvider {
    static var previews: some View {
        SermonCardView(sermon: Sermon(
            id: UUID(),
            title: "The Power of Faith",
            description: "This is a test sermon description about faith and its importance in our lives.",
            pastorName: "Pastor John Doe",
            videoURL: nil,
            audioURL: nil,
            thumbnailName: "sampleImage"  // Make sure to add a sample image in your assets
        ))
    }
}
