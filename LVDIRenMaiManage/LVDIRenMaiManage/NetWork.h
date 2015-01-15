//
//  NetWork.h
//  LVDIRenMaiManage
//
//  Created by rimi on 15-1-8.
//  Copyright (c) 2015年 Yangxiaofen. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NetWorkDelegate <NSObject>
/**协议方法*/
- (void)requestFinishedWithData:(id)object;
- (void)requestFaildWithdescription:(NSString *)description;

@end

@interface NetWork : NSObject

/**s设置代理*/
@property (nonatomic,assign) id <NetWorkDelegate> delegate;
- (void)sendPostRequestWithURLString:(NSString *)string dictionary:(NSDictionary *)dictionary;

+ (void)postRequest:(NSString *)interface parameter:(NSDictionary *)parameter completionHander:(void (^) (NSURLResponse *response, id responseData, NSError *connectionError))completionHander;
@end
