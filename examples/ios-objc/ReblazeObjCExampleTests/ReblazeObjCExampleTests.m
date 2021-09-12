//
//  ReblazeObjCExampleTests.m
//  ReblazeObjCExampleTests
//
//  Created by Rotem Doron on 10/11/2019.
//  Copyright © 2019-2021 Reblaze. All rights reserved.
//

#import <XCTest/XCTest.h>
@import ReblazeSDK;

@interface ReblazeObjCExampleTests : XCTestCase

@end

@implementation ReblazeObjCExampleTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    [reblaze setUid:@"uid"];
    NSLog(@"hash: %@", [reblaze generateHash]);
    NSString *hash1 = [reblaze generateHash];
    NSString *hash2 = [reblaze generateHash];
    XCTAssertNotEqual(hash1, hash2);
    XCTAssertEqual([hash1 substringToIndex:8], [hash2 substringToIndex:8]);
}

@end
