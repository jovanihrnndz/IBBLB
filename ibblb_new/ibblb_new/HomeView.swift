//
//  HomeView.swift
//  ibblb_new
//
//  Created by jovani Hernandez on 10/1/24.
//
import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = SermonViewModel()

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Banner at the top
                VStack(spacing: 0) {
                    Color(red: 38/255, green: 38/255, blue: 37/255)
                        .frame(height: 60)
                        .edgesIgnoringSafeArea(.top)

                    Image("banner")
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width, height: 100)
                        .clipped()
                }
                .frame(width: UIScreen.main.bounds.width)
                .edgesIgnoringSafeArea(.top)
                .padding(.bottom, 16)

                // Main Content (Sermons List)
                ScrollView {
                    LazyVStack(spacing: 16) {
                        ForEach(viewModel.sermons) { sermon in
                            SermonCardView(sermon: sermon)  // Updated to call SermonCardView
                        }
                    }
                    .padding(.horizontal, 16)
                }
                .onAppear {
                    viewModel.fetchSermons()  // Fetch sermons when the view appears
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
