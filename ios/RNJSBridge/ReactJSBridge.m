//
//  ReactJSBridge.m
//  RNJsBridgeiOS
//
//  Created by alexganggao on 2020/7/14.
//

#import "ReactJSBridge.h"
#import <React/RCTLog.h>
#import "JSBridgeFactory.h"
#import "Utils.h"
#import "BridgeRequest.h"
@implementation ReactJSBridge
// 将ReactJSBridge 导出为全局的 NativeModules，可以在React中使用 NativeModules.ReactJSBridge
RCT_EXPORT_MODULE();

// 自定义导出方法，以便js可以调用：jsbridge的格式为: jsbridge://moduleName/methodName?params1=value1&params2=value2
RCT_EXPORT_METHOD(call:(NSString *)jsbridge){
  JSBridgeFactory *base = [[JSBridgeFactory alloc] initWithMode:RN];
  BridgeRequest *request =[Utils bridgeRequestWidthURL: jsbridge];
  [base evaluateJSBridgeRequest:request withBlock:nil];
  
};

// 自定义导出方法，以便js可以调用，附带回调方法;jsbridge的格式为: jsbridge://moduleName/methodName?params1=value1&params2=value2
RCT_EXPORT_METHOD(callWithCallback:(NSString *) jsbridge callback:(RCTResponseSenderBlock)callback){
  JSBridgeFactory *base = [[JSBridgeFactory alloc] initWithMode:RN];
  BridgeRequest *request =[Utils bridgeRequestWidthURL: jsbridge];
  request.url=jsbridge;
  [base evaluateJSBridgeRequest:request withBlock:callback];
}


@end
