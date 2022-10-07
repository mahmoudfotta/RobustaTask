//
//  RepositoriesListController.swift
//  RobustaTask
//
//  Created by Mahmoud Abolfotoh on 07/10/2022.
//

import UIKit

class RepositoriesListController: UIViewController, Storyboarded {
    @IBOutlet weak var tableView: UITableView!
    let searchController = UISearchController(searchResultsController: nil)

    static var storyboardName: String = "Repositories"
    var presenter: RepositoriesListPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupSarchBar()
        fetchData()
    }

    func setupUI() {
        title = "Repositories List"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "RepoTableViewCell", bundle: .main), forCellReuseIdentifier: "RepoTableViewCell")
    }
    
    func setupSarchBar() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Repositories"
        navigationItem.searchController = searchController
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
        let owner = presenter?.getOwner(index: indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepoTableViewCell", for: indexPath) as! RepoTableViewCell
        cell.repoTitleLabel.text = repo?.fullName
        if let url = URL(string: owner?.avatarURL ?? "") {
            cell.ownerImageView.load(url)
        } else {
            cell.ownerImageView.image = nil
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let controller = presenter?.getDetailController(index: indexPath.row) else { return }
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

extension RepositoriesListController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
      let searchBar = searchController.searchBar
      presenter?.filterRepositories(with: searchBar.text ?? "")
      self.tableView.reloadData()
  }
}
