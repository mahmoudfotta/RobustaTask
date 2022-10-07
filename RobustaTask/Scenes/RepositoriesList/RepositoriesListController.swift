//
//  RepositoriesListController.swift
//  RobustaTask
//
//  Created by Mahmoud Abolfotoh on 07/10/2022.
//

import UIKit

class RepositoriesListController: UIViewController, Storyboarded {
    static var storyboardName: String = "Repositories"
    @IBOutlet weak var tableView: UITableView!
    

    var presenter: RepositoriesListPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchData()
    }

    func setupUI() {
        title = "Repositories List"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func fetchData() {
        presenter?.fetchReposList(completion: {[weak self] repos, errorMessage in
            guard let self = self else { return }
            if let _ = errorMessage {
                
            } else {
                self.tableView.reloadData()
            }
        })
    }
}

extension RepositoriesListController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getReposCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let repo = presenter?.getRepo(index: indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = repo?.fullName
        return cell
    }
}
