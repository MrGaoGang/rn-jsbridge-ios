//
//  RNJSBridgeRegister.m
//  RNJsBridgeiOS
//
//  Created by alexganggao on 2020/7/14.
//

#import "RNJSBridgeRegister.h"
#import "JSBridgeAppPlugins.h"

@implementation RNJSBridgeRegister
static NSMutableDictionary *jsBridgePlugins;

- (void)registerJSBridge{
  jsBridgePlugins = [[NSMutableDictionary alloc] initWithDictionary: @{
    @"app":[JSBridgeAppPlugins class]
  }];
  
}

- (NSMutableDictionary *)allJSBridgePlugins{
  return jsBridgePlugins;
}

@end
