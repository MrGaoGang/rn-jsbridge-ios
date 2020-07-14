//
//  BridgeRequest.h
//  RNJsBridgeiOS
//
//  Created by alexganggao on 2020/7/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BridgeRequest : NSObject
@property(nonatomic,copy)NSString *moduleName;
@property(nonatomic,copy)NSString *methodName;
@property(nonatomic,strong)NSDictionary *querys;
@property(nonatomic,copy)NSString *url;
- (instancetype)initWithModule:(NSString *)module method:(NSString *)method query:(NSDictionary *)querys;
@end

NS_ASSUME_NONNULL_END
