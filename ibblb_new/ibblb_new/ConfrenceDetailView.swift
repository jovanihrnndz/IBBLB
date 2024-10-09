//
//  ConfrenceDetailView.swift
//  ibblb_new
//
//  Created by jovani Hernandez on 10/1/24.
//

import SwiftUI

struct ConferenceDetailView: View {
    var conference: Conference
    @ObservedObject var viewModel: ConferenceViewModel

    var body: some View {
        VStack {
            Text(conference.name)
                .font(.largeTitle)
                .padding()

            // Display the list of sermons for the selected conference
            List(viewModel.selectedConferenceSermons) { sermon in
                SermonCardView(sermon: sermon)
            }
            .onAppear {
                viewModel.fetchSermons(for: conference.id)  // Fetch sermons for the selected conference
            }
        }
        .navigationTitle(conference.name)
    }
}

// Sample Data Preview for ConferenceDetailView
struct ConferenceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleConference = Conference(
            id: UUID(),
            name: "Conferencia de Jóvenes 2024",
            description: "Youth Conference focused on spiritual growth.",
            startDate: Date(),
            endDate: Date()
        )

        let sampleViewModel = ConferenceViewModel()
        sampleViewModel.selectedConferenceSermons = [
            Sermon(id: UUID(), title: "Lo que Jesus quiere para sus amigos", description: "Sermon by Pastor Luis Parada on Jesus' desires for His friends.", pastorName: "Pastor Luis Parada", videoURL: URL(string: "https://www.youtube.com/watch?v=xyz123"), audioURL: nil, thumbnailName: "Lo-que-Jesús-quiere-para-sus-amigos"),
            Sermon(id: UUID(), title: "El Cáncer De La Amargura", description: "A sermon on bitterness and how it affects believers.", pastorName: "Pastor Luis Parada", videoURL: URL(string: "https://www.youtube.com/watch?v=xyz456"), audioURL: nil, thumbnailName: "El-cáncer-de-la-amargura")
        ]
        
        return ConferenceDetailView(conference: sampleConference, viewModel: sampleViewModel)
    }
}

// Private DateFormatter for formatting dates
private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    return formatter
}()
