//
//  JSBridgeCommonBase.m
//  RNJsBridgeiOS
//
//  Created by mrgaogang on 2020/7/14.
//

#import "JSBridgeCommonBase.h"
#import "BridgeRequest.h"
#import "Const.h"
#import <React/RCTBridgeModule.h>
@interface JSBridgeCommonBase()
@property(nonatomic,strong)NSMutableDictionary *callbacks;
@end

@implementation JSBridgeCommonBase

- (NSMutableDictionary *)callbacks{
  if (_callbacks == nil) {
    _callbacks = [[NSMutableDictionary alloc] init];
  }
  return _callbacks;
}


/// 执行JSBridge
/// @param module 模块名称
/// @param method jsbridge的方法
/// @param query 请求参数
- (void)evaluateJSBridge:(BridgeRequest *)request{
  
  SEL selector = NSSelectorFromString([NSString stringWithFormat:@"evaluateJSBridge_%@:",request.methodName ]);
  if ([self respondsToSelector:selector]) {
    IMP imp = [self methodForSelector: selector];
    ((void (*) (id, SEL, BridgeRequest *))imp)(self, selector, request);
    NSLog(@"evaluate jsbridge://%@/%@ success!",request.moduleName,request.methodName);
  }else{
    NSLog(@"module = %@ may not impl method = %@",request.moduleName,[NSString stringWithFormat:@"evaluateJSBridge_%@:",request.methodName ]);
  }
  
}


/// 根据url去唯一标识一个callback，如果url相同及时连续调用多次，请返回的值应该是相同的
/// @param url jsbridge
/// @param block 回调方法
- (void)addBlockWithUrl:(NSString *)url block:(id)block{
  // 每一个key对应
  [self.callbacks setValue:block forKey:url];
}


/// 执行回调方法
/// @param data 需要回调的数据
/// @param request jsbride对象
- (void)evaluateJSCallback:(id)data withRequest:(BridgeRequest *)request{
  id callback = [self.callbacks objectForKey:request.url];
  // 如果是rn的话就直接执行
  if(self.runningMode == RN && callback!=nil){
    RCTResponseSenderBlock block = (RCTResponseSenderBlock)callback;
    block(@[data]);
  }
}

@end
