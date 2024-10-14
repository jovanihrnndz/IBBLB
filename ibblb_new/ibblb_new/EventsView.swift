//
//  EventsView.swift
//  ibblb_new
//
//  Created by jovani Hernandez on 10/1/24.
//

import SwiftUI

struct EventsView: View {
    @StateObject var eventViewModel = EventViewModel()  // ViewModel for fetching events

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Add the banner at the top
                BannerView(imageName: "banner", height: 100)

                // Main content (Event List) with ScrollView and LazyVStack
                ScrollView {
                    LazyVStack(spacing: 16) {
                        ForEach(eventViewModel.events) { event in
                            EventCardView(event: event)  // Display each event using the EventCardView
                        }
                    }
                    .padding(.horizontal, 16)  // Add padding for nicer layout
                }
                .onAppear {
                    eventViewModel.fetchEvents()  // Fetch events from the backend when the view appears
                }
            }
            
            .edgesIgnoringSafeArea(.top)  // Ensure the banner fills the top area
        }
    }
}

struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView()
    }
}
