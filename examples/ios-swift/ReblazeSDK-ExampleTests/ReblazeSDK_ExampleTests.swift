//
//  ReblazeSDK_ExampleTests.swift
//  ReblazeSDK-ExampleTests
//
//  Created by Rotem Doron on 06/05/2019.
//  Copyright © 2020-2021 Reblaze. All rights reserved.
//

import XCTest
import ReblazeSDK

class ReblazeSDK_ExampleTests: XCTestCase {

    override func setUp() {
        print("ReblazeSDKVersionNumber", ReblazeSDKVersionNumber)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        let hash1 = reblaze.generateHash()
        print("hash1", hash1)
        let hash2 = reblaze.generateHash()
        print("hash2", hash2)
        XCTAssertNotEqual(hash1, hash2)

        XCTAssertEqual(hash1.suffix(8), hash2.suffix(8))
        let stablePrefix = hash1.endIndex.utf16Offset(in: hash1) - 42
        XCTAssertEqual(hash1.prefix(stablePrefix), hash2.prefix(stablePrefix))
    }
}
