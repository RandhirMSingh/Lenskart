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

    }
    
    func execute() {
        
    }
}

