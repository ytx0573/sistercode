//
//  TianJiaGuanXiViewController.m
//  LVDIRenMaiManage
//
//  Created by rimi on 15-1-5.
//  Copyright (c) 2015年 Yangxiaofen. All rights reserved.
//

#import "TianJiaGuanXiViewController.h"

@interface TianJiaGuanXiViewController ()

@property (nonatomic,retain)UIImageView * photoImage;
@property (nonatomic,retain)UILabel * guanXiLeiXinLabel;
@property (nonatomic,retain)UILabel * mingZiLabel;
@property (nonatomic,retain)UILabel * qinMiChengDu;
@property (nonatomic,retain)UILabel * zhongYaoChengDu;
@property (nonatomic,retain)UILabel * beiZhuZingXi;

@property (nonatomic,retain)UIButton * xuanZeButton;
@property (nonatomic,retain)UIButton * guanXiLeiXinButton;
@property (nonatomic,retain)UIButton * qinMiChengDuButton;
@property (nonatomic,retain)UIButton * zhongYaoChengDuButton;

@property (nonatomic,retain)UITextField * nameTextField;
@property (nonatomic,retain)UITextField * beiZhuXinXI;




@end

@implementation TianJiaGuanXiViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIImageView * titleImage = [[UIImageView alloc] initWithFrame:CGRectMake(130, 25, 140, 20)];
    titleImage.image = [UIImage imageNamed:@"人脉关系建立_03.png"];
    [self.navc addSubview:titleImage];
    
    _photoImage = [[UIImageView alloc] initWithFrame:CGRectMake(25, 0, 40, 40)];
    _photoImage.layer.cornerRadius = 20;//圆角角度
    _photoImage.clipsToBounds = YES;//圆角显示
    
    _mingZiLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 90, 60, 60)];
    _mingZiLabel.layer.cornerRadius = 30;
    _mingZiLabel.text = @"关系类型";
    [self.view addSubview:_mingZiLabel];
    _guanXiLeiXinLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 90, 60, 60)];
    _guanXiLeiXinLabel.layer.cornerRadius = 30;
    _guanXiLeiXinLabel.text = @"关系类型";
    [self.view addSubview:_guanXiLeiXinLabel];
    _qinMiChengDu = [[UILabel alloc] initWithFrame:CGRectMake(40, 90, 60, 60)];
    _qinMiChengDu.layer.cornerRadius = 30;
    _qinMiChengDu.text = @"关系类型";
    [self.view addSubview:_qinMiChengDu];
    _zhongYaoChengDu = [[UILabel alloc] initWithFrame:CGRectMake(40, 90, 60, 60)];
    _zhongYaoChengDu.layer.cornerRadius = 30;
    _zhongYaoChengDu.text = @"关系类型";
    [self.view addSubview:_zhongYaoChengDu];
    _beiZhuZingXi = [[UILabel alloc] initWithFrame:CGRectMake(40, 90, 60, 60)];
    _beiZhuZingXi.layer.cornerRadius = 30;
    _beiZhuZingXi.text = @"关系类型";
    [self.view addSubview:_beiZhuZingXi];

    
    
    
    
    
    
    
    
}

@end
