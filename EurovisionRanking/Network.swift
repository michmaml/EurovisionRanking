//
//  Network.swift
//  EurovisionRanking
//
//  Created by Michal Sekulski on 12/06/2023.
//

import Foundation

private let countriesAPI = "https://my-json-server.typicode.com/michmaml/EurovisionRanking/db"

class Network: ObservableObject {
    struct BaseSong: Codable {
        let id: Int
        let countryName: String
        let artistName: String
        let songName: String
        let videoId: String
        let flagUrl: String
    }
        
    struct ApiResponse: Decodable {
        let countries: [BaseSong]
    }
    
    func getAllSongs() async throws -> [BaseSong] {
        guard let url = URL(string: countriesAPI) else { fatalError("Invalid URL") }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            if let decodedResponse = try? decoder.decode(ApiResponse.self, from: data) {
                return decodedResponse.countries
            } else {
                print("Invalid response from server")
            }
        } catch {
            print(error)
        }
        return []
    }
}
