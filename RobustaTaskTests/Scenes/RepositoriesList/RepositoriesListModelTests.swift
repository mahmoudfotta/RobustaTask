//
//  RepositoriesListModelTests.swift
//  RobustaTaskTests
//
//  Created by Mahmoud Abolfotoh on 07/10/2022.
//

import XCTest
@testable import RobustaTask

class RepositoriesListModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRepositoriesModelFetchedReposNotNil()  {
        //given
        let apiClientMock = RepositoriesListClientMock()
        let model = RepositoriesListModel(apiClient: apiClientMock)
        let expectation = expectation(description: "repos fetched correctly")
        var fetchedRepos: [Repository]?
        
        // when
        model.fetchReposList { repos, errorMessage in
            fetchedRepos = repos
            expectation.fulfill()
        }
        
        XCTAssertNotNil(fetchedRepos)
        wait(for: [expectation], timeout: 1)
    }
    
    func testRepositoriesModelFetchedReposCountIsCorrect()  {
        //given
        let apiClientMock = RepositoriesListClientMock()
        let model = RepositoriesListModel(apiClient: apiClientMock)
        let expectation = expectation(description: "repos fetched correctly")
        var fetchedRepos: [Repository]?
        
        // when
        model.fetchReposList { repos, errorMessage in
            fetchedRepos = repos
            expectation.fulfill()
        }
        
        XCTAssertEqual(fetchedRepos?.count, 1)
        wait(for: [expectation], timeout: 1)
    }

}

