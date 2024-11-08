//
//  MoviesDisplayView.swift
//  TMDBMovies
//
//  Created by Ariadna Cecilia López Colín on 01/11/24.
//

import UIKit

class MoviesDisplayView: UIViewController, UITableViewDataSource {
    
    private let tableView = UITableView()
    private let viewModel = MoviesDisplayViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        viewModel.onDataUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        viewModel.fetchMovies()
    }
    
    func setupTableView() {
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.register(MoviesDisplayViewCell.self, forCellReuseIdentifier: "MoviesDisplayViewCell")
        view.addSubview(tableView)
    }

    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = viewModel.movies[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoviesDisplayViewCell", for: indexPath) as! MoviesDisplayViewCell
        cell.configure(with: movie)
        return cell
    }
}

