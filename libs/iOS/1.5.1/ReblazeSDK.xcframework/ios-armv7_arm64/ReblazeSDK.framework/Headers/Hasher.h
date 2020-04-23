//
//  Hasher.h
//  Hasher
//
//  Created by guy doron on 17/07/2019.
//  Copyright © 2019 Moblers. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface Hasher : NSObject
- (NSString *) doHash:(NSString *)str timestampStr:(int)timestamp;

@end

NS_ASSUME_NONNULL_END

