//
//  Films.swift
//  SequeniaFilms
//
//  Created by OnlyFrenzy on 19.05.2021.
//

import Foundation

struct Films: Codable {
    let films: [Film]?
}

// MARK: - Film
struct Film: Codable {
    let id: Int?
    let localizedName, name: String?
    let year: Int?
    let rating: Double?
    let imageURL: String?
    let filmDescription: String?
    let genres: [String]?

    enum CodingKeys: String, CodingKey {
        case id
        case localizedName = "localized_name"
        case name, year, rating
        case imageURL = "image_url"
        case filmDescription = "description"
        case genres
    }
}

typealias FilmResponse = [Film]
