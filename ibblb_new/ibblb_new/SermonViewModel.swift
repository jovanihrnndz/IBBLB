//
//  SermonViewModel.swift
//  ibblb_new
//
//  Created by jovani Hernandez on 10/6/24.
//

import Foundation
import Combine

class SermonViewModel: ObservableObject {
    @Published var sermons: [Sermon] = []  // Holds the fetched sermons
    private var cancellables = Set<AnyCancellable>()
    
    // Fetch sermons from the backend
    func fetchSermons() {
        guard let url = URL(string: "https://church-api-514b292acefe.herokuapp.com/sermons") else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }  // Extract the data
            .decode(type: [Sermon].self, decoder: JSONDecoder())  // Decode into the Sermon model
            .receive(on: DispatchQueue.main)  // Ensure it happens on the main thread
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Error fetching sermons: \(error)")
                case .finished:
                    print("Finished fetching sermons")
                }
            }, receiveValue: { [weak self] sermons in
                self?.sermons = sermons  // Update the published sermons array
            })
            .store(in: &cancellables)
    }
}
