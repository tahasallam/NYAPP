//
//  NYAppTests.swift
//  NYAppTests
//
//  Created by Taha Abdelrahman on 3/20/19.
//  Copyright © 2019 apple. All rights reserved.
//


import XCTest

@testable import NYApp

class DataHubUnitTest: XCTestCase {

  

    func testMostPopular() {
        DataHub.getMostPopular(completion: {
            mostPopular,error in
            XCTAssertNil(error)
            XCTAssertNotNil(mostPopular)
        })
    }
}
