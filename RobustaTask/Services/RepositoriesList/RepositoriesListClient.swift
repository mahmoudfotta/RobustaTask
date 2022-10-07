//
//  RepositoriesListClient.swift
//  RobustaTask
//
//  Created by Mahmoud Abolfotoh on 06/10/2022.
//

import Foundation

class RepositoriesListClient: APIClient {
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        
        self.init(configuration: configuration)
    }
}

extension RepositoriesListClient: RepositoriesListClientProtocol {
    func getRepositoriesList(completion: @escaping (Result<[Repository]?, APIError>) -> Void) {
        let request = RepositoriesListProvider.getRepositoriesList.request
        fetch(with: request, decode: { json -> [Repository]? in
            guard let repos = json as? [Repository] else { return nil }
            return repos
        }, completion: completion)
    }
}
