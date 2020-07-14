//
//  Utils.h
//  RNJsBridgeiOS
//
//  Created by mrgaogang on 2020/7/14.
//

#import <Foundation/Foundation.h>
#import "BridgeRequest.h"
NS_ASSUME_NONNULL_BEGIN

@interface Utils : NSObject
+ (BridgeRequest *) bridgeRequestWidthURL:(NSString *)bridge;
@end

NS_ASSUME_NONNULL_END
