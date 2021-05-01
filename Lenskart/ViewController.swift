//
//  ViewController.swift
//  Lenskart
//
//  Created by Kumar Singh, Randhir on 01/05/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var tableViewModel: TableViewModel!
    
    lazy var tableViewModelBuilder: TableViewModelBuilder = MoviewListTableViewBuilder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTableView()
        buildTableViewModel()
    }
}

//


extension ViewController {
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func buildTableViewModel() {
        tableViewModelBuilder.buildTableViewModel { (tableVM) in
            tableViewModel = tableVM
        }
    }
}

//MARK: - TableView Datasource and Delegate Methods
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewModel.sections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewModel.sections[section].cellViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellVM = tableViewModel.sections[indexPath.section].cellViewModels[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellVM.reusableIndetifier, for: indexPath)
        
        cellVM.configure(cell: cell)
        return cell
    }
    
    
}

