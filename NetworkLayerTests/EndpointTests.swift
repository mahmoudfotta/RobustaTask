//
//  EndpointTests.swift
//  NetworkLayerTests
//
//  Created by Mahmoud Abolfotoh on 06/10/2022.
//

import XCTest
@testable import RobustaTask

class EndpointTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testEndpointSetURLCorrectly() {
        //given
        let provider = TestProvider.first
        
        //when
        let url = URL(string: "https://api.github.com/first")
        
        //then
        XCTAssertEqual(provider.request.url!, url!)
    }
    
    func testEndpointSetsMethodCorrectly() {
        //given
        let provider = TestProvider.first
        
        //when
        let method = HTTPMethod.get.rawValue
        
        //then
        XCTAssertEqual(provider.request.httpMethod, method)
    }
    
    func testEndpointSetsParamsCorrectly() {
        //given
        let provider = TestProvider.second
        
        //when
        let params = "{\"page\":\"1\"}".data(using: .utf8)
        
        //then
        XCTAssertEqual(provider.request.httpBody, params)
    }
}
