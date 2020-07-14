//
//  BridgeRequest.m
//  RNJsBridgeiOS
//
//  Created by mrgaogang on 2020/7/14.
//

#import "BridgeRequest.h"

@implementation BridgeRequest

- (instancetype)initWithModule:(NSString *)module method:(NSString *)method query:(NSDictionary *)querys{
  if (self = [super init]) {
    self.methodName=method;
    self.moduleName=module;
    self.querys=querys;
  }
  return self;
}

@end
