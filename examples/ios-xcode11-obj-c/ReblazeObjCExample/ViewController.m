//
//  ViewController.m
//  ReblazeObjCExample
//
//  Created by Rotem Doron on 10/11/2019.
//  Copyright © 2019-2021 Reblaze. All rights reserved.
//

#import "ViewController.h"
@import ReblazeSDK;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [reblaze setEventListener: ^(ReblazeSDK_Kind kind, NSString * _Nonnull message) {
        if (kind >= ReblazeSDK_KindINFO) {
            NSLog(@"reblaze: %ld %@", kind, message);
        }
    }];
    // Do any additional setup after loading the view.
}

- (IBAction)sendTestEvent:(id)sender {
    [reblaze sendEvent:@"Test Event"];
}

@end
