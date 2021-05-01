//
//  User.swift
//  Lenskart
//
//  Created by Kumar Singh, Randhir on 01/05/21.
//

import Foundation
//"id":"1","createdAt":"2021-04-30T07:53:24.661Z","name":"Ramona Stehr","avatar":
struct User: Codable {
    var id, createdAt, name, avatar: String
}

struct Movie: Codable {
    let id, voteCount: Int
    let genreIDS: [Int]
    let originalTitle, overview, backdropPath, posterPath, releaseDate, title: String
    let originalLanguage: OriginalLanguage
    let video, adult: Bool
    let popularity, voteAverage: Double

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

enum OriginalLanguage: String, Codable {
    case en = "en"
    case pt = "pt"
}

typealias Movies = [Movie]
