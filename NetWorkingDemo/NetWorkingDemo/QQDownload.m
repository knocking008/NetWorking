//
//  QQDownload.m
//  NetWorkingDemo
//
//  Created by vincentMac on 16/3/6.
//  Copyright © 2016年 vincentMac. All rights reserved.
//

#import "QQDownload.h"
#define kDownloadUrlStr @"http://dldir1.qq.com/qqfile/QQforMac/QQ_V4.0.2.dmg"
#define kTotalFileSize  @"totalSize"

@interface QQDownload ()<NSURLSessionDownloadDelegate>

@property (nonatomic, assign)long long totalSize;
@property (nonatomic, assign)long long currenSize;
@property (nonatomic, strong)NSFileHandle *fileHandle;
@property (nonatomic, strong)NSURLSessionDownloadTask *downloadTask;

@end


@implementation QQDownload
//初始化下载
- (void)initQQDownload
{
    /*
        a.判断本地是否已经存在该文件，若存在，则获取文件大小
     */
    if ([[NSFileManager defaultManager] fileExistsAtPath:[self getQQDownloadPath]]) {
        self.currenSize = [[[NSFileManager defaultManager] attributesOfItemAtPath:[self getQQDownloadPath] error:nil] fileSize];
        NSNumber *number = [[NSUserDefaults standardUserDefaults] objectForKey:kTotalFileSize];
        self.totalSize = [number longLongValue];
    }else{
        self.currenSize = 0;
        self.totalSize  = 0;
    }
}
//获取QQ文件存放路径
- (NSString *)getQQDownloadPath{
    //将下载到的文件存放在caches文件夹里，该文件不会被iTunes同步
    /*
     iTunes备份：YES -->备份  NO -->不备份
     沙盒目录:  a.Document  这个目录用于存储用户数据或其他应该定期备份的信息 YES
               b.Library   这个目录下有两个子目录：Caches 和 Preferences
                   1.Preferences 目录包含应用程序的偏好设置文件。您不应该直接创建偏好设置文件，而是应该使用NSUserDefaults类来取得和设置应用程序的偏好  YES
                   2.Caches 主要是缓存文件，用户使用过程中缓存都可以保存在这个目录中。需要手动删除这些文件 NO
               c.tmp 这个目录用于存放临时文件，保存应用程序再次启动过程中不需要的信息，重启后清空  NO
     */
    NSString *path = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
    path = [path stringByAppendingPathComponent:@"qq.dmg"];
    return path;
}

- (void)startDownload{
    NSURL *url = [NSURL URLWithString:kDownloadUrlStr];
    NSMutableURLRequest *mutabelUrlRequest = [NSMutableURLRequest requestWithURL:url];
    /*
        a.服务器接收的值格式为 bytes = %lld-  (告诉服务器我要从哪里下载)
        b.请求头的key为：Range
     */
    NSString *currenSizeStr = [NSString stringWithFormat:@"bytes=%lld-",self.currenSize];
    [mutabelUrlRequest setValue:currenSizeStr forHTTPHeaderField:@"Range"];
    
//    NSURLSessionConfiguration *config = [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:<#(nonnull NSString *)#>]
    
}














@end
