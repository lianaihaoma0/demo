//
//  Model.m
//  MVVMTest
//
//  Created by JeLon_Cai on 2016/10/23.
//  Copyright © 2016年 JeLon_Cai. All rights reserved.
//

#import "Model.h"
#import "AFNetworking.h"

static NSString *urlString = @"http://image.baidu.com/data/imgs?col=%e7%be%8e%e5%a5%b3&tag=%e5%b0%8f%e6%b8%85%e6%96%b0&sort=0&pn=1&rn=1&p=channel&from=1";

@implementation Model
+ (void)getImagesListWithPage: (NSInteger)aPage SuccessBlock :(SuccessBlock)success FailBlock :(FailBlock)fail {
    
    NSString *urlString = [NSString stringWithFormat:@"%@%d%@",@"http://image.baidu.com/data/imgs?col=%e7%be%8e%e5%a5%b3&tag=%e5%b0%8f%e6%b8%85%e6%96%b0&sort=0&pn=1",aPage,@"&rn=1&p=channel&from=1"];
    AFHTTPSessionManager *managere = [AFHTTPSessionManager manager];
    [managere GET:urlString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject,nil);
        NSLog(@"success");
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fail(nil,error);
        NSLog(@"fail");
    }];

}
@end

@implementation Imgs

@end

@implementation Owner

@end
