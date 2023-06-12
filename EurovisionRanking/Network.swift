//
//  Network.swift
//  EurovisionRanking
//
//  Created by Michal Sekulski on 12/06/2023.
//

import Foundation

class Network: ObservableObject {
    @Published var songs = [Song]()
    let countriesAPI = "https://my-json-server.typicode.com/gert-janvercauteren/mockapi/countries"

    func getRandomSong() async throws {
        guard let url = URL(string: countriesAPI) else { fatalError("Missing URL") }
        let urlRequest = URLRequest(url: url)

        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
        let decodedSong = try JSONDecoder().decode(Song.self, from: data)
        print("-----------------------------------")
        print("Async decodedSong", decodedSong)
    }
}
