//
//  TabBarViewController.m
//  LVDIRenMaiManage
//
//  Created by rimi on 15-1-5.
//  Copyright (c) 2015年 Yangxiaofen. All rights reserved.
//

#import "TabBarViewController.h"
#import "WodeRenMaiViewController.h"
#import "RenMaiKuViewController.h"
#import "KeNengViewController.h"
#import "TianJiaGuanXiViewController.h"
#import "GuanyuViewController.h"
#define CGGET_WIDTH  CGRectGetWidth(self.view.bounds)
#define CGGET_HEIGHT  CGRectGetHeight(self.view.bounds)

@interface TabBarViewController ()
{
    NSArray * buttonsArray;
    BOOL _isSelecd;

}
/** 自定义tabBar  上面加5个按钮*/
@property (nonatomic,retain)UIView * customTabBar;

@end

@implementation TabBarViewController

- (void)setTabBarHidden:(BOOL)flag
{
    self.customTabBar.hidden = flag;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.customTabBar = [[UIView alloc] initWithFrame:CGRectMake(0, CGGET_HEIGHT - 55, CGGET_WIDTH, 55)];
    _customTabBar.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"底部_02.png"]];
    [self.view addSubview:_customTabBar];
 
    _WDRMButton = [[UIButton alloc]initWithFrame:CGRectMake(15, 3, 60, 50)];
    [_WDRMButton setImage:[UIImage imageNamed:@"我的人脉未点击_03.png"] forState:UIControlStateNormal];
    [_WDRMButton setImage:[UIImage imageNamed:@"我的人脉点击_03.png"] forState:UIControlStateSelected];
    [_WDRMButton addTarget:self action:@selector(processWDRMBurron) forControlEvents:UIControlEventTouchUpInside];
//    _WDRMButton.selected = YES;
    
    _RMKButton = [[UIButton alloc]initWithFrame:CGRectMake(90, 3, 60, 50)];
    [_RMKButton setImage:[UIImage imageNamed:@"人脉库未点击_03.png"] forState:UIControlStateNormal];
    [_RMKButton setImage:[UIImage imageNamed:@"人脉库点击_03.png"] forState:UIControlStateSelected];
    [_RMKButton addTarget:self action:@selector(processRMButton) forControlEvents:UIControlEventTouchUpInside];
    
    _KNButtob = [[UIButton alloc]initWithFrame:CGRectMake(158, 3, 60, 50)];
    [_KNButtob setImage:[UIImage imageNamed:@"可能未点击_05.png"] forState:UIControlStateNormal];
    [_KNButtob setImage:[UIImage imageNamed:@"可能点击_05.png"] forState:UIControlStateSelected];
    [_KNButtob addTarget:self action:@selector(processKNBurron) forControlEvents:UIControlEventTouchUpInside];
    
    _TJGXButton = [[UIButton alloc]initWithFrame:CGRectMake(235, 3, 60, 50)];
    [_TJGXButton setImage:[UIImage imageNamed:@"添加关系未点击_03.png"] forState:UIControlStateNormal];
    [_TJGXButton setImage:[UIImage imageNamed:@"添加关系点击_03.png"] forState:UIControlStateSelected];
    [_TJGXButton addTarget:self action:@selector(processTJGXBurron) forControlEvents:UIControlEventTouchUpInside];
    
    _GYButton = [[UIButton alloc]initWithFrame:CGRectMake(310, 3, 60, 50)];
    [_GYButton setImage:[UIImage imageNamed:@"关于未点击_03.png"] forState:UIControlStateNormal];
    [_GYButton setImage:[UIImage imageNamed:@"关于点击_03.png"] forState:UIControlStateSelected];
    [_GYButton addTarget:self action:@selector(processGYBurron) forControlEvents:UIControlEventTouchUpInside];
    
    self.tabBar.hidden = YES;
    [_customTabBar addSubview:_WDRMButton];
    [_customTabBar addSubview:_RMKButton];
    [_customTabBar addSubview:_KNButtob];
    [_customTabBar addSubview:_TJGXButton];
    [_customTabBar addSubview:_GYButton];


}
     
- (void)processWDRMBurron
{
    self.selectedIndex = 0;
    _WDRMButton.selected = YES;
    _RMKButton.selected =NO;
     _KNButtob.selected = NO;
     _TJGXButton.selected = NO;
     _GYButton.selected = NO;
}

- (void)processRMButton
{
    self.selectedIndex = 1;
    _WDRMButton.selected = NO;
    _RMKButton.selected =YES;
    _KNButtob.selected = NO;
    _TJGXButton.selected = NO;
    _GYButton.selected = NO;}

- (void)processKNBurron
{
    self.selectedIndex = 2;
    _WDRMButton.selected = NO;
    _RMKButton.selected =NO;
    _KNButtob.selected = YES;
    _TJGXButton.selected = NO;
    _GYButton.selected = NO;
}
- (void)processTJGXBurron
{
    self.selectedIndex = 3;
    _WDRMButton.selected = NO;
    _RMKButton.selected =NO;
    _KNButtob.selected = NO;
    _TJGXButton.selected = YES;
    _GYButton.selected = NO;}

- (void)processGYBurron
{
    self.selectedIndex = 4;
    _WDRMButton.selected = NO;
    _RMKButton.selected =NO;
    _KNButtob.selected = NO;
    _TJGXButton.selected = NO;
    _GYButton.selected = YES;
}



@end
