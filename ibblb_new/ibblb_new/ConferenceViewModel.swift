import SwiftUI
import Combine
import Foundation

class ConferenceViewModel: ObservableObject {
    @Published var conferences: [Conference] = []
    @Published var selectedConferenceSermons: [Sermon] = []

    private var cancellables = Set<AnyCancellable>()

    // Fetch conferences from the API
    func fetchConferences() {
        guard let url = URL(string: "https://church-api-514b292acefe.herokuapp.com/conferences") else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }  // Extract the data
            .decode(type: [Conference].self, decoder: JSONDecoder())  // Decode into the Conference model
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Error fetching conferences: \(error)")
                case .finished:
                    print("Finished fetching conferences")
                }
            }, receiveValue: { [weak self] conferences in
                self?.conferences = conferences
            })
            .store(in: &cancellables)
    }

    // Fetch sermons for a specific conference by conference ID
    func fetchSermons(for conferenceID: UUID) {
        guard let url = URL(string: "https://church-api-514b292acefe.herokuapp.com/conferences/\(conferenceID)/sermons") else {
            print("Invalid URL for fetching sermons")
            return
        }

        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [Sermon].self, decoder: JSONDecoder())  // Decode into Sermon model
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Error fetching sermons: \(error)")
                case .finished:
                    print("Finished fetching sermons")
                }
            }, receiveValue: { [weak self] sermons in
                self?.selectedConferenceSermons = sermons
            })
            .store(in: &cancellables)
    }
}
