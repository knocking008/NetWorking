//
//  HTTPConnection.m
//  NetWorkingDemo
//
//  Created by vincentMac on 16/3/5.
//  Copyright © 2016年 vincentMac. All rights reserved.
//

#import "HTTPConnection.h"

@implementation HTTPConnection

+ (void)getNetDatasWithUrlStr:(NSString *)url params:(NSDictionary *)params block:(DataBlock)block error:(ErrorBlock)error
{
    [[HTTPConnection new] getNetDatasWithUrlStr:url params:params block:block error:error];
}
- (void)getNetDatasWithUrlStr:(NSString *)url params:(NSDictionary *)params block:(DataBlock)block error:(ErrorBlock)error
{
    //config
    /**
     defaultSessionConfiguration;                   默认配置
     ephemeralSessionConfiguration;                 不缓存任何用户信息
     backgroundSessionConfigurationWithIdentifier;  后台下载用
     */

    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    config.timeoutIntervalForRequest = 20;
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    /**
     NSURLSessionDataTask      数据请求
     NSURLSessionUploadTask    上传
     NSURLSessionDownloadTask  下载
     */
    NSURLSessionTask *task = [session dataTaskWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        NSLog(@"data--->>%@",data);
        NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSLog(@"jsonDic--->>%@",jsonDic);
    }];
    [task resume];
}
@end
