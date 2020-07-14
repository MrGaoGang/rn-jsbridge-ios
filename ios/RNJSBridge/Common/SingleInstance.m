//
//  SingleInstance.m
//  RNJsBridgeiOS
//
//  Created by mrgaogang on 2020/7/14.
//

#import "SingleInstance.h"

@implementation SingleInstance

static SingleInstance* _instance = nil;

+ (instancetype) shareInstance{
  static dispatch_once_t onceToken ;
  dispatch_once(&onceToken, ^{
    _instance = [[super allocWithZone:NULL] init] ;
  }) ;
  
  return _instance ;
}

+ (id) allocWithZone:(struct _NSZone *)zone{
  return [SingleInstance shareInstance] ;
}

- (id) copyWithZone:(struct _NSZone *)zone{
  return [SingleInstance shareInstance] ;
}
@end
