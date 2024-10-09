//
//  EventCardView.swift
//  ibblb_new
//
//  Created by jovani Hernandez on 10/6/24.
//

import SwiftUI

struct EventCardView: View {
    var event: Event

    var body: some View {
        VStack(alignment: .leading) {
            // Event thumbnail
            Image(event.thumbnailName)
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width - 40, height: 200)
                .clipped()
                .cornerRadius(12)

            // Event details
            VStack(alignment: .leading, spacing: 4) {
                Text(event.title)
                    .font(.headline)
                    .foregroundColor(.black)  // Set title color
                    .padding(.top, 0)

                Text(event.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(2)  // Limit the description to two lines
                    .padding(.bottom, 2)

                Text("Date: \(event.date)")
                    .font(.caption)
                    .foregroundColor(.blue)  // Set date color
            }
            .padding(.horizontal)
            .padding(.bottom, 10)  // Adjust padding for bottom space
        }
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 4)
        .padding(.vertical, 8)  // Consistent vertical padding for spacing between cards
    }
}

struct EventCardView_Previews: PreviewProvider {
    static var previews: some View {
        EventCardView(event: Event(
            id: UUID(),
            title: "Youth Conference 2024",
            description: "A powerful gathering for youth across the region.",
            date: "August 1-3, 2024",
            thumbnailName: "sampleEventImage"  // Add a sample image in Assets
        ))
    }
}
