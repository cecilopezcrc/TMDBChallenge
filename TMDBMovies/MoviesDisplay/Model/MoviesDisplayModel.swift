//
//  MoviesDisplayModel.swift
//  TMDBMovies
//
//  Created by Ariadna Cecilia López Colín on 01/11/24.
//

import Foundation

struct MoviesDisplayModel: Codable {
    let title: String
    let releaseDate: String
    let posterPath: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case releaseDate = "release_date"
        case posterPath = "poster_path"
    }
}
