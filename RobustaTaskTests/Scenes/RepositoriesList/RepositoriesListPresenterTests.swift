//
//  RepositoriesListPresenterTests.swift
//  RobustaTaskTests
//
//  Created by Mahmoud Abolfotoh on 07/10/2022.
//

import XCTest
@testable import RobustaTask

class RepositoriesListPresenterTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRepositoriesListPresenterFetchedReposNotNil() throws {
        //given
        let apiClientMock = RepositoriesListClientMock()
        let model = RepositoriesListModel(apiClient: apiClientMock)
        let presenter = RepositoriesListPresenter(repositoriesModel: model)
        let expectation = expectation(description: "repos fetched correctly")
        var fetchedRepos: [Repository]?
        
        //when
        presenter.fetchReposList { repos, errorMessage in
            fetchedRepos = repos
            expectation.fulfill()
        }
        
        //then
        XCTAssertNotNil(fetchedRepos)
        wait(for: [expectation], timeout: 1)
    }
    
    func testRepositoriesListPresenterGetReposCountReturnsCorrectCount() throws {
        //given
        let apiClientMock = RepositoriesListClientMock()
        let model = RepositoriesListModel(apiClient: apiClientMock)
        let presenter = RepositoriesListPresenter(repositoriesModel: model)
        let expectation = expectation(description: "repos fetched correctly")
        
        //when
        presenter.fetchReposList { repos, errorMessage in
            expectation.fulfill()
        }
        
        //then
        XCTAssertEqual(presenter.getReposCount(), 1)
        wait(for: [expectation], timeout: 1)
    }

    func testRepositoriesListPresenterGetRepoReturnsCorrectRepo() throws {
        //given
        let apiClientMock = RepositoriesListClientMock()
        let model = RepositoriesListModel(apiClient: apiClientMock)
        let presenter = RepositoriesListPresenter(repositoriesModel: model)
        let expectation = expectation(description: "repos fetched correctly")
        var fetchedRepos: [Repository]?
        
        //when
        presenter.fetchReposList { repos, errorMessage in
            fetchedRepos = repos
            expectation.fulfill()
        }
        
        //then
        XCTAssertEqual(presenter.getRepo(index: 0).name, fetchedRepos![0].name)
        wait(for: [expectation], timeout: 1)
    }
}
