//
//  JSBridgeCommonBase.h
//  RNJsBridgeiOS
//
//  Created by mrgaogang on 2020/7/14.
//

#import <Foundation/Foundation.h>
#import "RNJSBridgeRegister.h"
#import "BridgeRequest.h"
#import "Const.h"
NS_ASSUME_NONNULL_BEGIN

@interface JSBridgeCommonBase : NSObject
@property(nonatomic,assign) ENVIRONMENT_MODE runningMode;
- (void)evaluateJSBridge:(BridgeRequest *)request;
- (void)addBlockWithUrl:(NSString *)url block:(id)block;
- (void)evaluateJSCallback:(id) data withRequest:(BridgeRequest *)request;
@end

NS_ASSUME_NONNULL_END
