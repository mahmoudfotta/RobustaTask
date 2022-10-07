//
//  RepositoryDetailController.swift
//  RobustaTask
//
//  Created by Mahmoud Abolfotoh on 07/10/2022.
//

import UIKit

class RepositoryDetailController: UIViewController, Storyboarded {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    static var storyboardName: String = "RepositoryDetail"
    var presenter: RepositoriesDetailPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        title = presenter?.getRepoName()
        titleLabel.text = presenter?.getRepoFullName()
        descLabel.text = presenter?.getRepoDescription()
    }

}
