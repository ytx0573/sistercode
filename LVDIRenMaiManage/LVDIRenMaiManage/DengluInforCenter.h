//
//  DengluInforCenter.h
//  LVDIRenMaiManage
//
//  Created by rimi on 15-1-8.
//  Copyright (c) 2015年 Yangxiaofen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DengluInforCenter : NSObject
/**是否登录*/
@property (nonatomic,assign) BOOL isLogin;
/**单例 登录记录*/
+ (DengluInforCenter *)sharedDengluInforCenter;

@end
