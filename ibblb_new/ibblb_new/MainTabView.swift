//
//  ContentView.swift
//  ibblb_new
//
//  Created by jovani Hernandez on 10/1/24.
//

import SwiftUI

struct MainTabView: View {
    @State private var isActive = false  // Controls when to switch from splash screen to main content

    var body: some View {
        Group {
            if isActive {
                // Show the TabView (Main content) when isActive is true
                TabView {
                    HomeView()
                        .tabItem {
                            Label("Home", systemImage: "house.fill")
                        }

                    StreamingView(url: URL(string: "https://www.youtube.com/watch?v=7XExAC2R1Ts")!)
                        .tabItem {
                            Label("Streaming", systemImage: "tv.fill")
                        }

                    EventsView()  // This will now reference the newly created EventsView
                            .tabItem {
                                Label("Events", systemImage: "calendar")
                        }

                    ConferenceListView()
                        .tabItem {
                            Label("Conferences", systemImage: "person.3.fill")
                        }

                    GivingView()
                        .tabItem {
                            Label("Give", systemImage: "heart.fill")
                        }

                    MoreView()
                        .tabItem {
                            Label("More", systemImage: "ellipsis.circle")
                        }
                }
            } else {
                // Show SplashView when isActive is false
                SplashView()
            }
        }
        .onAppear {
            // Delay for 2 seconds before transitioning to the main view
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    isActive = true  // Switch to the main content
                }
            }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
