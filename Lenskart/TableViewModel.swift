//
//  TableViewModel.swift
//  Lenskart
//
//  Created by Kumar Singh, Randhir on 01/05/21.
//

import Foundation
import UIKit


protocol TableViewModel {
    var sections: [TableViewSectionModel] {get}
}

protocol TableViewSectionModel {
    var cellViewModels: [TableViewCellModel] {get}
    
}

protocol TableViewCellModel {
    var reusableIndetifier: String {get}
    func configure(cell: UITableViewCell)
    func execute()
}

struct MoviewListTableView: TableViewModel {
    var sections: [TableViewSectionModel]
}

struct MovieListTableViewSection: TableViewSectionModel  {
    var cellViewModels: [TableViewCellModel]
}

struct MoviewTableViewCellViewModel: TableViewCellModel {
    var reusableIndetifier = "MovieListCell"

    var movie: Movie
    
    func configure(cell: UITableViewCell) {
        let movieCell = cell as! MovieListTableViewCell
        movieCell.titleLabel.text = movie.title
        movieCell.ratingLabel.text = "\(movie.voteAverage)"
        movieCell.movieImageView.load(urlPath: baseURL+movie.posterPath)
        
    }
    
    func execute() {
        
    }
}

fileprivate var imageCache = [String: UIImage]()
fileprivate let baseURL = "http://image.tmdb.org/t/p/w92"
extension UIImageView {
     func load(urlPath: String) {
        if let image = imageCache[urlPath] {
            self.image = image
            return
        }
        
        DispatchQueue.global(qos: .userInteractive).async {
            guard let url = URL(string: urlPath),
                  let data = try? Data(contentsOf: url),
                  let image = UIImage(data: data) else {
                //No Image available, default to default image
                return
            }
            
            DispatchQueue.main.async { [unowned self] in
                self.image = image
                imageCache[urlPath] = image
            }
        }
    }
}
