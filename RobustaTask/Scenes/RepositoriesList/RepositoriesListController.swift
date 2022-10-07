//
//  RepositoriesListController.swift
//  RobustaTask
//
//  Created by Mahmoud Abolfotoh on 07/10/2022.
//

import UIKit

class RepositoriesListController: UIViewController, Storyboarded {
    static var storyboardName: String = "Repositories"
    

    var presenter: RepositoriesListPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Repositories List"
        presenter?.fetchReposList(completion: { repos, errorMessage in
            print(repos)
        })
    }

}
