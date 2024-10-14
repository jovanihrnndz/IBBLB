//
//  EventViewModel.swift
//  ibblb_new
//
//  Created by jovani Hernandez on 10/7/24.
//

import Foundation
import Combine

class EventViewModel: ObservableObject {
    @Published var events: [Event] = []  // Array to hold events

    private var cancellables = Set<AnyCancellable>()  // For storing Combine subscriptions

    func fetchEvents() {
        guard let url = URL(string: "https://church-api-514b292acefe.herokuapp.com/events") else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [Event].self, decoder: JSONDecoder())
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
