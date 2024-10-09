//
//  ConfrenceListView.swift
//  ibblb_new
//
//  Created by jovani Hernandez on 10/1/24.
//

import SwiftUI

struct ConferenceListView: View {
    @StateObject var viewModel = ConferenceViewModel()

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Add the banner at the top
                BannerView()
                
                // Main content (Conference List)
                List(viewModel.conferences) { conference in
                    NavigationLink(destination: ConferenceDetailView(conference: conference, viewModel: viewModel)) {
                        VStack(alignment: .leading) {
                            Text(conference.name)
                                .font(.headline)

                            Text(conference.description)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .onAppear {
                    viewModel.fetchConferences()  // Fetch conferences from the backend
                }
            }
            .edgesIgnoringSafeArea(.top)  // Ensure banner is not obstructed by system areas
        }
    }
}

struct ConferenceListView_Previews: PreviewProvider {
    static var previews: some View {
        ConferenceListView()
    }
}
