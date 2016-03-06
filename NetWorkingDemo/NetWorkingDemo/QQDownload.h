//
//  QQDownload.h
//  NetWorkingDemo
//
//  Created by vincentMac on 16/3/6.
//  Copyright © 2016年 vincentMac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QQDownload : NSObject

- (void)initQQDownload;
- (void)startDownload;
- (void)stopDownlosd;
- (long long)getSizeOfTheFileHasBeenDownloaded;
@end
