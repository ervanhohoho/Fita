//
//  QueryResultModel.swift
//  Fita-Music
//
//  Created by Ervan Dharmawan on 10/10/21.
//

import Foundation

struct QueryResultModel: Codable{
    var resultCount: Int
    var results: [TrackModel]
}
struct TrackModel: Codable{
    var trackId: String
    var trackName: String
    var artistName: String
    var artworkUrl60: String
    var isStreamable: Bool
    var previewUrl: String
}
