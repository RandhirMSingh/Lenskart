//
//  TableViewModel.swift
//  Lenskart
//
//  Created by Kumar Singh, Randhir on 01/05/21.
//

import Foundation


protocol TableViewModel {
    var sections: [TableViewSectionModel] {get}
}

protocol TableViewSectionModel {
    var cells: [TableViewCellModel] {get}
    
}

protocol TableViewCellModel {
    func configure()
    func execute()
}

struct MoviewListTableView: TableViewModel {
    var sections: [TableViewSectionModel]
}

struct MovieListTableViewSection: TableViewSectionModel  {
    var cells: [TableViewCellModel]
}

struct MoviewListTableViewCell: TableViewCellModel {
    var movie: Movie
    
    func configure() {

    }
    
    func execute() {
        
    }
}

