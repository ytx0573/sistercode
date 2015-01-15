//
//  ViewController.m
//  LVDIRenMaiManage
//
//  Created by rimi on 15-1-5.
//  Copyright (c) 2015年 Yangxiaofen. All rights reserved.
//

#import "ViewController.h"
#import "TabBarViewController.h"

#import "WodeRenMaiViewController.h"
#import "RenMaiKuViewController.h"
#import "KeNengViewController.h"
#import "TianJiaGuanXiViewController.h"
#import "GuanyuViewController.h"
#define CGGET_WIDTH  CGRectGetWidth(self.view.bounds)
#define CGGET_HEIGHT  CGRectGetHeight(self.view.bounds)





@interface ViewController ()

@property (nonatomic,retain)UITabBarController * tabbarViewContrller;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _navc = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, CGGET_WIDTH, 64)];
    _navc.image = [UIImage imageNamed:@"顶.png"];
//    [_navc setBackgroundColor: [UIColor colorWithPatternImage:[UIImage imageNamed:@"顶.png"]]];
    [self.view addSubview:_navc];
    
    
}


@end
