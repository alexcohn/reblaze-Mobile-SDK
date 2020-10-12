//
//  ReblazeSDK_ExampleTests.swift
//  ReblazeSDK-ExampleTests
//
//  Created by Rotem Doron on 06/05/2019.
//  Copyright © 2020 Reblaze. All rights reserved.
//

import XCTest
import ReblazeSDK

class ReblazeSDK_ExampleTests: XCTestCase {

    override func setUp() {
        print("ReblazeSDKVersionNumber=\(ReblazeSDKVersionNumber)")
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        do {
            try Reblaze.configure(secret: "secret", uid: "uid")
            var hash = try Reblaze.getHash(unixTimestamp: 123456)
            print(hash)
            XCTAssertEqual(hash, "d20240f5ceec37dacaa55fa45d91b4d8")
            try Reblaze.configure(secret: "secret1", uid: "uid")
            hash = try Reblaze.getHash(unixTimestamp: 123456)
            print(hash)
            XCTAssertEqual(hash, "b3a131323f8023d60c7edfe5968e42c4")
            try Reblaze.configure(secret: "secret", uid: "uid1")
            hash = try Reblaze.getHash(unixTimestamp: 123456)
            print(hash)
            XCTAssertEqual(hash, "06d3d4600ff25781df2349afe6553f0e")
        }
        catch let error {
            print((error as? LocalizedError)?.errorDescription as Any)
            XCTAssertNil(error)
        }
    }
}
