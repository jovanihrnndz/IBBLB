//
//  EventsView.swift
//  ibblb_new
//
//  Created by jovani Hernandez on 10/1/24.
//

import SwiftUI

struct EventsView: View {
    @StateObject var viewModel = EventViewModel()

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Add the banner at the top
                BannerView()

                // Main content (Event List)
                List(viewModel.events) { event in
                    VStack(alignment: .leading) {
                        Text(event.title)
                            .font(.headline)

                        Text(event.description)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                .onAppear {
                    viewModel.fetchEvents()  // Fetch events from the backend
                }
            }
            .edgesIgnoringSafeArea(.top)  // Ensure the banner is not obstructed by system areas
        }
    }
}

struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView()
    }
}
