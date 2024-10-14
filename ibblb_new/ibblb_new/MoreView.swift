//
//  MoreView.swift
//  ibblb_new
//
//  Created by jovani Hernandez on 10/1/24.
//

import SwiftUI

struct MoreView: View {
    var body: some View {
        VStack(spacing: 0) {
            // Add the banner at the top
            BannerView(imageName: "banner", height: 100)
            
            // Main content below the banner
            List {
                NavigationLink(destination: Text("Settings View")) {
                    Text("Settings")
                }
                NavigationLink(destination: Text("Contact Us View")) {
                    Text("Contact Us")
                }
                NavigationLink(destination: Text("About View")) {
                    Text("About")
                }
            }
            .listStyle(InsetGroupedListStyle())  // Optional: Adjust the list style if needed
        }
        .edgesIgnoringSafeArea(.top)  // Ensure the banner goes to the top of the screen
        .navigationTitle("More")
    }
}

struct MoreView_Previews: PreviewProvider {
    static var previews: some View {
        MoreView()
    }
}
