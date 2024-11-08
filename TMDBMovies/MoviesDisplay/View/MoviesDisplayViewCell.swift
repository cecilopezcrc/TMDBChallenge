//
//  MoviesDisplayViewCell.swift
//  TMDBMovies
//
//  Created by Ariadna Cecilia López Colín on 01/11/24.
//

import UIKit

class MoviesDisplayViewCell: UITableViewCell {
    
    private let titleMovieLabel = UILabel()
    private let dateMovieLabel = UILabel()
    private let posterMovieImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(titleMovieLabel)
        contentView.addSubview(dateMovieLabel)
        contentView.addSubview(posterMovieImageView)
        
        titleMovieLabel.translatesAutoresizingMaskIntoConstraints = false
        dateMovieLabel.translatesAutoresizingMaskIntoConstraints = false
        posterMovieImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            posterMovieImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            posterMovieImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            posterMovieImageView.widthAnchor.constraint(equalToConstant: 60),
            posterMovieImageView.heightAnchor.constraint(equalToConstant: 90),
            
            titleMovieLabel.leadingAnchor.constraint(equalTo: posterMovieImageView.trailingAnchor, constant: 16),
            titleMovieLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            titleMovieLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            dateMovieLabel.leadingAnchor.constraint(equalTo: titleMovieLabel.leadingAnchor),
            dateMovieLabel.topAnchor.constraint(equalTo: titleMovieLabel.bottomAnchor, constant: 8),
            dateMovieLabel.trailingAnchor.constraint(equalTo: titleMovieLabel.trailingAnchor),
            dateMovieLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with movie: MoviesDisplayModel) {
        titleMovieLabel.text = movie.title
        titleMovieLabel.font = UIFont(name: "PlayfairDisplay-Black", size: 20)
        titleMovieLabel.textColor = .blue
        dateMovieLabel.text = "Release: \(movie.releaseDate)"
        dateMovieLabel.font = UIFont(name: "PlayfairDisplay-SemiBoldItalic", size: 17)
        dateMovieLabel.textColor = .systemYellow
        
        
        if let url = URL(string: "https://image.tmdb.org/t/p/w500\(movie.posterPath)") {
            posterMovieImageView.loadImage(from: url)
        }
    }
}

extension UIImageView {
    func loadImage(from url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self?.image = image
                }
            }
        }
    }
}
