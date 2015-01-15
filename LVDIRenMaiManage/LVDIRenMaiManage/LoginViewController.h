//
//  LoginViewController.h
//  LVDIRenMaiManage
//
//  Created by rimi on 15-1-8.
//  Copyright (c) 2015年 Yangxiaofen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController

@property (nonatomic,retain) NSMutableArray * dataSource;

/***通知我的人脉请求开始*/
@property (nonatomic, copy) void(^complte)(void);

@end
