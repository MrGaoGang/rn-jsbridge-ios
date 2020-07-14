//
//  Utils.m
//  RNJsBridgeiOS
//
//  Created by mrgaogang on 2020/7/14.
//

#import "Utils.h"
@implementation Utils

+ (BridgeRequest *) bridgeRequestWidthURL:(NSString *)bridge{
  NSURL *url = [NSURL URLWithString: bridge];
  if (![url.scheme isEqualToString:@"jsbridge"]) {
    return nil;
  }
  BridgeRequest *request = [[BridgeRequest alloc] initWithModule:url.host method:url.lastPathComponent query: [Utils getParams:bridge]];
  return request;
}


+ (NSDictionary *)getParams:(NSString *)str{
  NSRange range = [str rangeOfString:@"?"];
  
  NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
  if (range.length==0) {
    return parameters;
  }
  NSString *parametersString = [str substringFromIndex:range.location + 1];
  if ([parametersString containsString:@"&"]) {
    NSArray *urlComponents = [parametersString componentsSeparatedByString:@"&"];
    
    for (NSString *keyValuePair in urlComponents) {
      NSArray *pairComponents = [keyValuePair componentsSeparatedByString:@"="];
      NSString *key = [pairComponents.firstObject stringByRemovingPercentEncoding];
      NSString *value = [pairComponents.lastObject stringByRemovingPercentEncoding];
      
      if (key == nil || value == nil) {
        continue;
      }
      
      id existValue = [parameters valueForKey:key];
      if (existValue != nil) {
        if ([existValue isKindOfClass:[NSArray class]]) {
          NSMutableArray *items = [NSMutableArray arrayWithArray:existValue];
          [items addObject:value];
          [parameters setValue:items forKey:key];
        } else {
          [parameters setValue:@[existValue, value] forKey:key];
        }
      } else {
        [parameters setValue:value forKey:key];
      }
    }
  }else {
    NSArray *pairComponents = [parametersString componentsSeparatedByString:@"="];
    if (pairComponents.count == 1) {
      return nil;
    }
    
    NSString *key = [pairComponents.firstObject stringByRemovingPercentEncoding];
    NSString *value = [pairComponents.lastObject stringByRemovingPercentEncoding];
    
    if (key == nil || value == nil) {
      return nil;
    }
    [parameters setValue:value forKey:key];
  }
  
  return [NSDictionary dictionaryWithDictionary: parameters];
}

@end
