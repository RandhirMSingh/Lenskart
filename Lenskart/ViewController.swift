//
//  ViewController.swift
//  Lenskart
//
//  Created by Kumar Singh, Randhir on 01/05/21.
//

import UIKit

class ViewController: UIViewController {
    var tableView: UITableView!
    var tableViewModel: TableViewModel!
   // let tableViewModelBuilder: TableViewModelBuilder = TableViewModelBuilder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTableView()
        buildTableViewModel()
    }
}


extension ViewController {
    func setupTableView() {
        //create table view
        tableView = UITableView(frame: self.view.frame, style: .insetGrouped)
        tableView.dataSource = self
        tableView.delegate = self
        //create
    }
    
    func buildTableViewModel() {
        
    }
}

//MARK: - TableView Datasource and Delegate Methods
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}

