//
//  RepositoriesListClientMock.swift
//  RobustaTaskTests
//
//  Created by Mahmoud Abolfotoh on 07/10/2022.
//

import Foundation
@testable import RobustaTask

class RepositoriesListClientMock: RepositoriesListClientProtocol {
    func getRepositoriesList(completion: @escaping (Result<[Repository]?, APIError>) -> Void) {
        let owner = Owner(avatarURL: "http://avatar-url")
        let repos = Repository(name: "first repo", fullName: "first repo/git", description: "first github created repo", owner: owner)
        let result: Result<[Repository]?, APIError>
        result = .success([repos])
        completion(result)
    }
}
