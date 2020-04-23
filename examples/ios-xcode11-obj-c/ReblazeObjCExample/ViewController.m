//
//  ViewController.m
//  ReblazeObjCExample
//
//  Created by Rotem Doron on 10/11/2019.
//  Copyright © 2019 Moblers. All rights reserved.
//

#import "ViewController.h"
@import ReblazeSDK;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserverForName: NSNotification.ReblazeErrorNotification object: nil queue: NSOperationQueue.mainQueue usingBlock:^(NSNotification * _Nonnull notif) {

        NSLog(@"%@", notif.object);
    }];
    // Do any additional setup after loading the view.
}

- (IBAction)sendTestEvent:(id)sender {
    [Reblaze sendEventWithEventName:@"Test Event"];
}

@end
