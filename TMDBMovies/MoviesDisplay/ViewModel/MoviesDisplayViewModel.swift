//
//  MoviesDisplayViewModel.swift
//  TMDBMovies
//
//  Created by Ariadna Cecilia López Colín on 01/11/24.
//

import Foundation
import UIKit

class MoviesDisplayViewModel {
    
    private let apiMovieKey = "818ecb991f30a944723585baad2ec3a9"
    private let baseUrl = "https://api.themoviedb.org/3/movie/popular"
    
    var movies: [MoviesDisplayModel] = []
    var onDataUpdated: (() -> Void)?
    
    func fetchMovies() {
        guard let url = URL(string: "\(baseUrl)?api_key=\(apiMovieKey)&language=en-US&page=1") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if let error = error {
                print("Error to load data: \(error)")
                return
            }
            
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(MovieListResponse.self, from: data)
                self?.movies = decodedResponse.results
                self?.onDataUpdated?()
            } catch {
                print("Error to decode data: \(error)")
            }
        }
        
        task.resume()
    }
    
    func loadImage(for MoviesDisplayModel: MoviesDisplayModel, completion: @escaping (UIImage?) -> Void) {
        let posterUrl = "https://image.tmdb.org/t/p/w500\(MoviesDisplayModel.posterPath)"
        guard let url = URL(string: posterUrl) else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data, let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            completion(image)
        }
        
        task.resume()
    }
}

struct MovieListResponse: Codable {
    let results: [MoviesDisplayModel]
}
