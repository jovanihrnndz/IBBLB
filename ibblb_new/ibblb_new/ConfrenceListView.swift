//
//  ConfrenceListView.swift
//  ibblb_new
//
//  Created by jovani Hernandez on 10/1/24.
//

import SwiftUI

struct ConferenceListView: View {
    @StateObject var viewModel = ConferenceViewModel()  // Initialize the view model here

    @State private var showAlert = false
    @State private var errorMessage = ""

    var body: some View {
        VStack(spacing: 0) {
            BannerView(imageName: "banner", height: 100)

            if viewModel.conferences.isEmpty {
                Text("No conferences available").padding()
            } else {
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
            }
        }
        .onAppear {
            viewModel.fetchConferences()  // Fetch conferences when the view appears
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
        }
        .onReceive(viewModel.$fetchError) { error in  // Listen for fetch errors
            if let error = error {
                showAlert = true
                errorMessage = error.localizedDescription
            }
        }
    }
}

struct ConferenceListView_Previews: PreviewProvider {
    static var previews: some View {
        ConferenceListView()
    }
}
