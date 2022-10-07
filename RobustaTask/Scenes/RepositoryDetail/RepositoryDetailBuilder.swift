//
//  RepositoryDetailBuilder.swift
//  RobustaTask
//
//  Created by Mahmoud Abolfotoh on 07/10/2022.
//

import UIKit

final class RepositoriesDetailBuilder {
    class func buildViewController(with repo: Repository?) -> UIViewController {
        let viewController = RepositoryDetailController.instantiate()
        let presenter = RepositoriesDetailPresenter(repository: repo)
        viewController.presenter = presenter
        return viewController
    }
}
