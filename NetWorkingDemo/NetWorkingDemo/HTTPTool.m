//
//  HTTPTool.m
//  NetWorkingDemo
//
//  Created by vincentMac on 16/3/5.
//  Copyright © 2016年 vincentMac. All rights reserved.
//

#import "HTTPTool.h"
#import "AFNetworking.h"
#import "NSBannerModel.h"
@implementation HTTPTool

+ (void)httpToolGetNetDatasWithUrlStr:(NSString *)url params:(NSDictionary *)params dataBlock:(CallBackBlock)block errorBlock:(ErrorBlock)error
{
    [[HTTPTool new] httpToolGetNetDatasWithUrlStr:url params:params dataBlock:block errorBlock:error];
}

- (void)httpToolGetNetDatasWithUrlStr:(NSString *)url params:(NSDictionary *)params dataBlock:(CallBackBlock)block errorBlock:(ErrorBlock)error
{
    self.block = block;
    self.error = error;
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
//    sessionManager.requestSerializer     = [AFHTTPRequestSerializer serializer];
    sessionManager.responseSerializer    = [AFHTTPResponseSerializer serializer];
    [sessionManager GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"downloadProgress--->>%@",downloadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *JSONDic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        //获取banner网络数据
        NSMutableArray *bannerArray = [NSMutableArray new];
        NSDictionary *data = JSONDic[@"data"];
        for (NSDictionary *bannerDic in data[@"banner_list"]) {
            NSBannerModel *model = [[NSBannerModel alloc] init];
            [model setValuesForKeysWithDictionary:bannerDic];
            [bannerArray addObject:model];
        }
        
        if (self.block) {
            self.block(bannerArray);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (self.error) {
            self.error(error);
        }
    }];
}

@end
