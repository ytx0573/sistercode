//
//  DengluInforCenter.m
//  LVDIRenMaiManage
//
//  Created by rimi on 15-1-8.
//  Copyright (c) 2015年 Yangxiaofen. All rights reserved.
//

#import "DengluInforCenter.h"

static DengluInforCenter * dengluInformation = nil;
@implementation DengluInforCenter

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.isLogin = NO;
    }
    return self;
}

+ (DengluInforCenter *)sharedDengluInforCenter
{
    if (!dengluInformation) {
        dengluInformation = [[DengluInforCenter alloc]init];
    }
    return dengluInformation;
}
@end
