//
//  JSBridgeFactory.h
//  RNJsBridgeiOS
//
//  Created by alexganggao on 2020/7/14.
//

#import <Foundation/Foundation.h>
#import "BridgeRequest.h"
#import "Const.h"
NS_ASSUME_NONNULL_BEGIN

@interface JSBridgeFactory : NSObject
- (void)evaluateJSBridgeRequest:(BridgeRequest *)request withBlock:(id)block ;
- (instancetype) initWithMode:(ENVIRONMENT_MODE) mode;

@end

NS_ASSUME_NONNULL_END
