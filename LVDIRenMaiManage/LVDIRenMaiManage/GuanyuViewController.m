//
//  GuanyuViewController.m
//  LVDIRenMaiManage
//
//  Created by rimi on 15-1-5.
//  Copyright (c) 2015年 Yangxiaofen. All rights reserved.
//

#import "GuanyuViewController.h"

@interface GuanyuViewController ()

@end

@implementation GuanyuViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIImageView * titleImage = [[UIImageView alloc] initWithFrame:CGRectMake(140, 25, 60, 20)];
    titleImage.image = [UIImage imageNamed:@"关于title.png"];
    [self.navc addSubview:titleImage];
    
    
    
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 54, 350, 558)];
    imageView.image = [UIImage imageNamed:@"设置_02.png"];
    [self.view addSubview:imageView];
    
    UIButton * shuaxinButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 460, 350, 30)];
    [shuaxinButton setImage:[UIImage imageNamed:@"检查更新_03.png"] forState:UIControlStateNormal];
    [imageView addSubview:shuaxinButton];
    
    
    UIButton * tuiChuButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 510, 350, 30)];
    [tuiChuButton setImage:[UIImage imageNamed:@"退出登录_03.png"] forState:UIControlStateNormal];
    [imageView addSubview:tuiChuButton];

    
    
    
}


@end
