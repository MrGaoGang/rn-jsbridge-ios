//
//  RNJSBridgeRegister.h
//  RNJsBridgeiOS
//
//  Created by mrgaogang on 2020/7/14.
//

#import "SingleInstance.h"

NS_ASSUME_NONNULL_BEGIN

@interface RNJSBridgeRegister : SingleInstance

- (void) registerJSBridge;

- (NSMutableDictionary *) allJSBridgePlugins;

@end

NS_ASSUME_NONNULL_END
