//
//  RepositoriesListPresenter.swift
//  RobustaTask
//
//  Created by Mahmoud Abolfotoh on 07/10/2022.
//

import Foundation
import UIKit

class RepositoriesListPresenter {
    private var repositoriesModel: RepositoriesListModel?
    private var repositories: [Repository] = []
    private var filteredRepositories: [Repository] = []
    private var errorMessage: String?
    
    init (repositoriesModel: RepositoriesListModel?) {
        self.repositoriesModel = repositoriesModel
    }
    
    func fetchReposList(completion: @escaping (_ repos: [Repository]?, _ errorMessage: String?) -> Void) {
        repositoriesModel?.fetchReposList(completion: {[weak self] repos, errorMessage in
            guard let self = self else { return }
            if let errorMessage = errorMessage {
                self.errorMessage = errorMessage
                completion(nil, errorMessage)
            } else {
                self.repositories = repos ?? []
                self.filteredRepositories = repos ?? []
                completion(repos, nil)
            }
        })
    }
    
    func getReposCount() -> Int {
        return filteredRepositories.count
    }
    
    func getRepo(index: Int) -> Repository {
        return filteredRepositories[index]
    }
    
    func getOwner(index: Int) -> Owner {
        return filteredRepositories[index].owner
    }
    
    func filterRepositories(with text: String) {
        if text.count >= 2 {
            let lowerdText = text.lowercased()
            filteredRepositories = repositories.filter { $0.fullName?.lowercased().contains(lowerdText) ?? false }
        } else {
            filteredRepositories = repositories
        }
    }
    
    func getDetailController(index: Int) -> UIViewController {
        let repo = filteredRepositories[index]
        let detailController = RepositoriesDetailBuilder.buildViewController(with: repo)
        return detailController
    }
}
