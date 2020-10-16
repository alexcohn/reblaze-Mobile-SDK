#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface Hasher : NSObject
+ (NSString *) doHash:(NSString *)str timestamp:(int)timestamp;

@end

NS_ASSUME_NONNULL_END

