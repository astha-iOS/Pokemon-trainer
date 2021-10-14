//
//  WefoxTests.swift
//  WefoxTests
//
//  Created by Astha yadav on 12/10/21.
//

import XCTest
@testable import Wefox

class WefoxTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func tests_ApiClass() throws{
        XCTAssertNotEqual("Astha", "Yadav")
    }
}
