//
//  RepositoriesListModel.swift
//  RobustaTask
//
//  Created by Mahmoud Abolfotoh on 07/10/2022.
//

import Foundation

class RepositoriesListModel {
    var apiClient: RepositoriesListClientProtocol?
    
    init(apiClient: RepositoriesListClientProtocol?) {
        self.apiClient = apiClient
    }
    
    func fetchReposList(completion: @escaping (_ repos: [Repository]?, _ errorMessage: String?) -> Void) {
        apiClient?.getRepositoriesList(completion: { result in
            switch result {
            case .success(let repos):
                completion(repos, nil)
            case .failure(let apiError):
                completion(nil, apiError.errorDescription)
            }
        })
    }
}
