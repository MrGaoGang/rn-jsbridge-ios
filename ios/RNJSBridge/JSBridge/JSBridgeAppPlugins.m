//
//  JSBridgeAppPlugins.m
//  RNJsBridgeiOS
//
//  Created by mrgaogang on 2020/7/14.
//
#import <UIKit/UIKit.h>

#import "JSBridgeAppPlugins.h"
#import "BridgeRequest.h"
@implementation JSBridgeAppPlugins


// 一个样例，获取App的信息，使用callback返回
- (void)evaluateJSBridge_getAppInfo:(BridgeRequest *)request{
  NSString *deviceName = [[UIDevice currentDevice] name];
  NSString *sysVersion = [[UIDevice currentDevice] systemVersion];
  NSString *deviceUUID = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
  
  
  // 执行js回调
  [self evaluateJSCallback:@{
    @"deviceName":deviceName,
    @"sysVersion":sysVersion,
    @"uuid":deviceUUID
  }withRequest:request];
}


// 一个样例：显示ios自带的对话框
- (void)evaluateJSBridge_showToast:(BridgeRequest *)request{
  NSDictionary *query = request.querys;
  // 主线程中执行
  dispatch_async(dispatch_get_main_queue(), ^{
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:query[@"title"]
                                                                   message:query[@"msg"]
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
      //响应事件
      NSLog(@"action = %@", action);
    }];
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * action) {
      //响应事件
      NSLog(@"action = %@", action);
    }];
    
    [alert addAction:defaultAction];
    [alert addAction:cancelAction];
    [rootViewController presentViewController:alert animated:YES completion:nil];
  });
  
}
@end
