//
//  RepositoryDetailPresenter.swift
//  RobustaTask
//
//  Created by Mahmoud Abolfotoh on 07/10/2022.
//

import Foundation

class RepositoriesDetailPresenter {
    private var repository: Repository?
    
    init (repository: Repository?) {
        self.repository = repository
    }
    
    func getRepoName() -> String {
        return repository?.name ?? "No name"
    }
    
    func getRepoFullName() -> String {
        return repository?.fullName ?? "No full name"
    }
    
    func getRepoDescription() -> String {
        return repository?.description ?? "No description"
    }
    
}
