//
//  BaseSong.swift
//  EurovisionRanking
//
//  Created by Michal Sekulski on 13/06/2023.
//

import Foundation

struct ApiResponse: Decodable  {
    let countries: [BaseSong]
}

struct BaseSong: Identifiable, Decodable {
    var id = Int()
    
    let countryname: String
    let artistName: String
    let songName: String
    let videoId: String
    let flagUrl: String

}
