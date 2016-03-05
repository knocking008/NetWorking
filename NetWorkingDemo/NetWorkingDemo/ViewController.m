//
//  ViewController.m
//  NetWorkingDemo
//
//  Created by vincentMac on 16/3/5.
//  Copyright © 2016年 vincentMac. All rights reserved.
//

#import "ViewController.h"
#import "HTTPTool.h"
#import "HTTPConnection.h"
#import "NSBannerModel.h"
#define KHomeContentUrlStr  @"http://m.zhinanmao.com/tripapi/indexData?system=iPhone&system_version=9.2&app_id=1&from=app&platform=1&v=2.6.0&phone_type=iPhone8,1&idfa=638B5429-1A2D-411E-B7B2-7ABF8E092A8D"
#define kUrl @"http://iappfree.candou.com:8080/free/applications/limited?page=1&currency=rmb"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    [self getNetDatas];
}
- (void)initUI{
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)getNetDatas{
    [HTTPTool httpToolGetNetDatasWithUrlStr:KHomeContentUrlStr params:nil dataBlock:^(NSArray *data) {
        NSLog(@"请求数据成功-->>%@",data);
        NSBannerModel *model = [data firstObject];
        NSLog(@"model--->>%@",model.title);
        
    } errorBlock:^(NSError *error) {
        NSLog(@"getNetDatasWithUrlStr-error-->%@",error);
    }];
    
//    [HTTPConnection getNetDatasWithUrlStr:KHomeContentUrlStr params:nil block:^(NSArray *data) {
//        
//    } error:^(NSError *error) {
//        
//    }];
}
@end
