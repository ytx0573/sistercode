//
//  NetWork.m
//  LVDIRenMaiManage
//
//  Created by rimi on 15-1-8.
//  Copyright (c) 2015年 Yangxiaofen. All rights reserved.
//

#import "NetWork.h"

@interface NetWork ()<NSURLConnectionDelegate,NSURLConnectionDataDelegate>
{
    NSMutableData * _data;
}

@end

@implementation NetWork


- (void)sendPostRequestWithURLString:(NSString *)string dictionary:(NSDictionary *)dictionary
{
    //请求路径
    NSURL * url = [NSURL URLWithString:string];
    //创建请求
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:url];
    //请求方式
    [request setHTTPMethod:@"POST"];
    //将字典中的数据转换为string
    NSMutableString * srcString = [NSMutableString string];
    
    for (NSString * key in dictionary) {
        [srcString appendFormat:@"%@=%@&",key,dictionary[key]];
    }
    //存为data数据类型
    NSData * data = [srcString dataUsingEncoding:NSUTF8StringEncoding];
    //
    [request setHTTPBody:data];
    //提交请求
    [NSURLConnection connectionWithRequest:request delegate:self];
}

+ (void)postRequest:(NSString *)interface parameter:(NSDictionary *)parameter completionHander:(void (^) (NSURLResponse *response, id responseData, NSError *connectionError))completionHander;
{
    //请求路径
    NSURL * url = [NSURL URLWithString:interface];
    //创建请求
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:url];
    //请求方式
    [request setHTTPMethod:@"POST"];
    //将字典中的数据转换为string
    NSMutableString * srcString = [NSMutableString string];
    
    for (NSString * key in parameter) {
        [srcString appendFormat:@"%@=%@&",key, parameter[key]];
    }
    //存为data数据类型
    NSData * data = [srcString dataUsingEncoding:NSUTF8StringEncoding];
    //请求体
    [request setHTTPBody:data];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    //
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        //block回调
        completionHander ? completionHander(response, [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil], connectionError) : nil;
    }];
}


#pragma mark -- dalegate
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"链接失败%@",error.localizedDescription);
    if (_delegate && [_delegate respondsToSelector:@selector(requestFaildWithdescription:)]) {
        [_delegate requestFaildWithdescription:[error localizedDescription]];
    }
}




- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    _data = [[NSMutableData alloc] init];
    
    NSLog(@"data = %@",_data);
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_data appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"数据接收完毕");
    id objc = [NSJSONSerialization JSONObjectWithData:_data options:NSJSONReadingMutableLeaves error:nil];
//    NSLog(@"objc = %@",objc);
    if (_delegate && [_delegate respondsToSelector:@selector(requestFinishedWithData:)]) {
        [_delegate requestFinishedWithData:objc];
    }
    
}
@end
