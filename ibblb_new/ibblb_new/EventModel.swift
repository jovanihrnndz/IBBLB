//
//  EventModel.swift
//  ibblb_new
//
//  Created by jovani Hernandez on 10/7/24.
//

import Foundation
import Combine

class EventViewModel: ObservableObject {
    @Published var events: [Event] = []  // Holds the fetched events
    private var cancellables = Set<AnyCancellable>()
    
    func fetchEvents() {
        guard let url = URL(string: "https://church-api-514b292acefe.herokuapp.com/events") else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { output -> Data in
                // Log the raw response for debugging
                print(String(data: output.data, encoding: .utf8) ?? "No data")
                return output.data
            }
            .decode(type: [Event].self, decoder: {
                let decoder = JSONDecoder()
                
                // Specify how to decode dates
                decoder.dateDecodingStrategy = .iso8601 // Adjust this if necessary
                return decoder
            }())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Error fetching events: \(error)")
                case .finished:
                    print("Finished fetching events")
                }
            }, receiveValue: { [weak self] events in
                self?.events = events
            })
            .store(in: &cancellables)
    }
}
