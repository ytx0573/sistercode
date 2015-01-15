//
//  SeacherViewController.m
//  LVDIRenMaiManage
//
//  Created by rimi on 15-1-5.
//  Copyright (c) 2015年 Yangxiaofen. All rights reserved.
//

#import "SeacherViewController.h"
#import "RenMaiKuViewController.h"
#import "TabBarViewController.h"

@interface SeacherViewController ()
{
    UIView * _seacherView;                    //我的人脉收索视图
    TabBarViewController * tabBarController;  //   自定义cell
}

@end

@implementation SeacherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    
    
//    _seacherView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, CGGET_HEIGHT)];
//    _seacherView.center = CGPointMake(- (CGRectGetMidX(self.view.bounds) - 28), CGRectGetMidY(self.view.bounds));
//    _seacherView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"搜索背景_02_02.png"]];
//    [self.view addSubview:_seacherView];
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"pppppp"]]];
    
    UIImageView * seacherViewTitle = [[UIImageView alloc] initWithFrame:CGRectMake(30, 20, 130, 30)];
    seacherViewTitle.image = [UIImage imageNamed:@"我的人脉搜索_03.png"];
    [seacherViewTitle setUserInteractionEnabled:YES];
    [self.view addSubview:seacherViewTitle];
    
    UIButton * cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(CGGET_WIDTH - 150, 20, 50, 20)];
    [cancelButton setImage:[UIImage imageNamed:@"取消_03.png"] forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(processCancelButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cancelButton];
    
    
    UIButton * seachViewSeachButton = [[UIButton alloc]initWithFrame:CGRectMake(5, 400, 150, 40)];
    [seachViewSeachButton setFrame:CGRectMake(5, 400, 150, 40)];
    [seachViewSeachButton setImage:[UIImage imageNamed:@"搜索按钮_03.png"] forState:UIControlStateNormal];
    [seachViewSeachButton addTarget:self action:@selector(processseachViewSeachButton) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:seachViewSeachButton];
    
    UIButton * seachViewChongzhiButton = [[UIButton alloc]initWithFrame:CGRectMake(160, 400, 150, 50)];
    [seachViewChongzhiButton setImage:[UIImage imageNamed:@"重置按钮_03.png"] forState:UIControlStateNormal];
    
    [seachViewChongzhiButton addTarget:self action:@selector(processSeachViewChongzhiButton) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:seachViewChongzhiButton];

}



- (void)processseachViewSeachButton
{
    
    RenMaiKuViewController * seacherDetail = [[RenMaiKuViewController alloc] init];
    seacherDetail.tableView.center = CGPointMake(CGRectGetMidX(self.view.bounds), 64);
    seacherDetail.headView.hidden = YES;
    seacherDetail.seachButton.hidden = YES;
    [self.navigationController pushViewController:seacherDetail animated:YES];
    _seacherView.hidden = YES;
    
}
- (void)processSeachViewChongzhiButton
{
    
}

- (void)processCancelButton
{
    [UIView animateWithDuration:0.5 animations:^{
        [(TabBarViewController *)[[[[UIApplication sharedApplication] delegate] window] rootViewController] setTabBarHidden:NO];
        [tabBarController didMoveToParentViewController:self];
        self.view.center = CGPointMake( CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds));
        _seacherView.center = CGPointMake(- 200, CGRectGetMidY(self.view.bounds));
    }];
    
}


@end
