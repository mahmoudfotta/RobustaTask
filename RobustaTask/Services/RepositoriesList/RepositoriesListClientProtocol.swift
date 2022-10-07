//
//  RepositoriesListClientProtocol.swift
//  RobustaTask
//
//  Created by Mahmoud Abolfotoh on 06/10/2022.
//

import Foundation

protocol RepositoriesListClientProtocol {
    func getRepositoriesList(completion: @escaping (Result<[Repository]?, APIError>) -> Void)
}
