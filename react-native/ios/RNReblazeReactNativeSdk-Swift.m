//
//  RNReblazeReactNativeSdk.m
//  RNReblazeReactNativeSdk
//
//  Created by guy doron on 27/05/2019.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_REMAP_MODULE(RNReblazeReactNativeSdk, ReblazeReactNativeSdk, NSObject)
RCT_EXTERN_METHOD(start: (NSString *)url secret:(NSString *)secret headerName:(NSString *)headerName headerValue:(NSString *)headerValue)
RCT_EXTERN_METHOD(sendEvent: eventName(NSString *)eventName)
@end

