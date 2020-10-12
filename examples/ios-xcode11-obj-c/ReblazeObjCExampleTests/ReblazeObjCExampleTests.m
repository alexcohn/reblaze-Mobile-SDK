//
//  ReblazeObjCExampleTests.m
//  ReblazeObjCExampleTests
//
//  Created by Rotem Doron on 10/11/2019.
//  Copyright © 2019 Reblaze. All rights reserved.
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
    [Reblaze configureWithSecret:@"secret"
                                uid:@"uid"
                              error: nil];
    NSLog(@"hash: %@", [Reblaze getHashWithUnixTimestamp:123456 error:nil]);
}

@end
