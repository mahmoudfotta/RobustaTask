//
//  RepositoriesListPresenter.swift
//  RobustaTask
//
//  Created by Mahmoud Abolfotoh on 07/10/2022.
//

import Foundation

class RepositoriesListPresenter {
    private var repositoriesModel: RepositoriesListModel?
    private var repositories: [Repository] = []
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
                completion(repos, nil)
            }
        })
    }
    
    func getReposCount() -> Int {
        return repositories.count
    }
    
    func getRepo(index: Int) -> Repository {
        return repositories[index]
    }
    
    func getOwner(index: Int) -> Owner {
        return repositories[index].owner
    }
}
