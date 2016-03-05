//
//  HTTPTool.h
//  NetWorkingDemo
//
//  Created by vincentMac on 16/3/5.
//  Copyright © 2016年 vincentMac. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^CallBackBlock)(NSArray *data);
typedef void(^ErrorBlock)(NSError *error);

@interface HTTPTool : NSObject
@property (nonatomic, copy)CallBackBlock block;
@property (nonatomic, copy)ErrorBlock error;

+ (void)httpToolGetNetDatasWithUrlStr:(NSString *)url params:(NSDictionary *)params dataBlock:(CallBackBlock)block errorBlock:(ErrorBlock)error;

@end
