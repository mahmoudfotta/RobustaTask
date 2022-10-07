//
//  RepositoriesListBuilder.swift
//  RobustaTask
//
//  Created by Mahmoud Abolfotoh on 07/10/2022.
//

import UIKit

final class RepositoriesListBuilder {
    class func buildViewController() -> UIViewController {
        let viewController = RepositoriesListController.instantiate()
        let apiClient: RepositoriesListClientProtocol = RepositoriesListClient()
        let model = RepositoriesListModel(apiClient: apiClient)
        let presenter = RepositoriesListPresenter(repositoriesModel: model)
        viewController.presenter = presenter
        
        let naviagtionController = UINavigationController(rootViewController: viewController)
        
        return naviagtionController
    }
}
