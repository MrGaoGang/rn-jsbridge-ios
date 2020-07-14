//
//  JSBridgeFactory.m
//  RNJsBridgeiOS
//
//  Created by mrgaogang on 2020/7/14.
//

#import "JSBridgeFactory.h"
#import "RNJSBridgeRegister.h"
#import "JSBridgeCommonBase.h"
@interface JSBridgeFactory()
@property(nonatomic,strong) NSMutableDictionary *bridgePlugins;
@property(nonatomic,assign) ENVIRONMENT_MODE mode;
@end

@implementation JSBridgeFactory

- (NSMutableDictionary *)bridgePlugins{
  if (_bridgePlugins == nil) {
    _bridgePlugins = [[RNJSBridgeRegister shareInstance] allJSBridgePlugins];
  }
  return _bridgePlugins;;
}

// 指定加载方式
- (instancetype)initWithMode:(ENVIRONMENT_MODE)mode{
  if (self=[super init]) {
    self.mode=mode;
  }
  return self;
}


/// 执行jsbridge
/// @param request jsbridge对象
- (void)evaluateJSBridgeRequest:(BridgeRequest *)request withBlock:(id)block {
  if (request!=nil) {
    // 找到对应的module
    Class class =[self.bridgePlugins objectForKey:request.moduleName];
    id base = [self instanceWithClass:class];
    // 限制所有的jsbridge需要继承自JSBridgeCommonBase
    if ([base isKindOfClass:[JSBridgeCommonBase class]]) {
      JSBridgeCommonBase *base = [self instanceWithClass:class];
      if (block!=nil) {
        [base addBlockWithUrl:request.url block:block];
      }
      base.runningMode=self.mode;
      // 在JSBridgeCommonBase中统一执行对应的方法
      [base evaluateJSBridge:request];
    }else{
      NSLog(@"module=%@ is not kind of JSBridgeCommonBase",request.moduleName);
    }
    
  }else{
    NSLog(@"jsbridge schema is incorrect!");
  }
}

- (id) instanceWithClass:(Class )pluginClass{
  if (nil == pluginClass){
    return nil;
  }
  id instance = [pluginClass new] ;
  return instance;
}

@end
