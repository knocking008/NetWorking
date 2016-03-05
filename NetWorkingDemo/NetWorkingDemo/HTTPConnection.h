//
//  HTTPConnection.h
//  NetWorkingDemo
//
//  Created by vincentMac on 16/3/5.
//  Copyright © 2016年 vincentMac. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^DataBlock)(NSArray *data);
typedef void(^ErrorBlock)(NSError *error);

@interface HTTPConnection : NSObject
@property (nonatomic, copy)DataBlock block;
@property (nonatomic, copy)ErrorBlock error;
+ (void)getNetDatasWithUrlStr:(NSString *)url params:(NSDictionary *)params block:(DataBlock)block error:(ErrorBlock)error;
@end
