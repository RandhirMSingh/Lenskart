//
//  TableViewModelBuilder.swift
//  Lenskart
//
//  Created by Kumar Singh, Randhir on 01/05/21.
//

import Foundation

protocol TableViewModelBuilder {
    mutating func buildTableViewModel(completion: (TableViewModel) -> Void)
    mutating func getTableViewModel(completion: (TableViewModel) -> Void)
}

struct MoviewListTableViewBuilder: TableViewModelBuilder {
    private var cachedTableVM: MoviewListTableView?
    
    mutating func buildTableViewModel(completion: (TableViewModel) -> Void) {
        let networkingService = NetworkService<Movies>()
        var sectionVMs: [MovieListTableViewSection]?
        
        networkingService.get { (result) in
            switch result {
            case .success(let movies):
                let cellVM = movies.map { (movie) -> MoviewListTableViewCell in
                    MoviewListTableViewCell(movie: movie)
                }
                sectionVMs = [MovieListTableViewSection(cellViewModels: cellVM)]
            case .failure(let error):
                //Hanlde failure
                print(error.localizedDescription)
                break
            }
        }
        
        cachedTVM = MoviewListTableView(sections: sectionVMs ?? [])
        completion(cachedTVM!)
    }
    
    mutating func getTableViewModel(completion: (TableViewModel) -> Void) {
        guard let cachedTVM = cachedTVM else {
            self.buildTableViewModel { (tableVM) in
                completion(tableVM)
            }
            return
        }
        
        completion(cachedTVM)
    }
    
    private var cachedTVM: TableViewModel?
    
}

