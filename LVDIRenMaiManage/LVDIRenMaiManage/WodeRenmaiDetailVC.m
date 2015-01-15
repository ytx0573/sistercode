//
//  WodeRenmaiDetailVC.m
//  LVDIRenMaiManage
//
//  Created by rimi on 15-1-12.
//  Copyright (c) 2015年 Yangxiaofen. All rights reserved.
//

#import "WodeRenmaiDetailVC.h"

@interface WodeRenmaiDetailVC ()

@property (nonatomic,retain)UIImageView * mingPianImage;
@property (nonatomic,retain)UIImageView * touXiangImage;
@property (nonatomic,retain)UIImageView * sexImage;

@property (nonatomic,retain)UILabel * nameLabel;
@property (nonatomic,retain)UILabel * photoNumber;

@property (nonatomic,retain)UIButton * informationEdit;
@property (nonatomic,retain)UIButton * mingPianShear;

@property (nonatomic,retain)UIButton * callButton;
@property (nonatomic,retain)UIButton * SentInformationButton;
@property (nonatomic,retain)UIButton * postButton;
@property (nonatomic,retain)UIButton * jieChuGuanXi;
@property (nonatomic,retain)UIButton * chaKanMingPian;
@property (nonatomic,retain)UIButton * fangWenWeiuBo;

@property (nonatomic,retain) UIScrollView * detailScrollView;




@end

@implementation WodeRenmaiDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton * backButton = [[UIButton alloc]initWithFrame:CGRectMake(20, 10, 50, 50)];
    [backButton setImage:[UIImage imageNamed:@"返回_03.png"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(processBackButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    
    UIImageView * titleImage = [[UIImageView alloc] initWithFrame:CGRectMake(100, 20, 150, 20)];
    titleImage.image = [UIImage imageNamed:@"详情_03.png"];
    [self.navc addSubview:titleImage];
    
    _mingPianImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"人脉详情_卡片.png"]];
    _mingPianImage.frame = CGRectMake(20, 70, 340, 200);
    [self.view addSubview:_mingPianImage];
    UIImageView * lineImage = [[UIImageView alloc] initWithFrame:CGRectMake(100, 170, 150, 20)];
    lineImage.image = [UIImage imageNamed:@"人脉详情_线"];
    [self.view addSubview:lineImage];
    
    _touXiangImage = [[UIImageView alloc] init];
    _touXiangImage.frame = CGRectMake(5, 10, 60, 60);
    _touXiangImage.layer.cornerRadius = 30;
    [_mingPianImage addSubview:_touXiangImage];
    _sexImage = [[UIImageView alloc] init];
    _sexImage.frame = CGRectMake(130, 90, 20, 20);
    [_mingPianImage addSubview:_sexImage];
    
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(150, 100, 100, 20)];
    [_mingPianImage addSubview:_nameLabel];
    _photoNumber = [[UILabel alloc] initWithFrame:CGRectMake(130, 80, 100, 20)];
    _photoNumber.text = @"电话";
    [_mingPianImage addSubview:_photoNumber];
    
    _informationEdit = [[UIButton alloc] initWithFrame:CGRectMake(130, 90, 80, 30)];
    [_informationEdit setImage:[UIImage imageNamed:@"信息编辑_03.png"] forState:UIControlStateNormal];
    [_informationEdit addTarget:self action:@selector(processInformationEdit) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_informationEdit];
    
    _mingPianShear = [[UIButton alloc] initWithFrame:CGRectMake(260, 90, 80, 30)];
    [_mingPianShear setImage:[UIImage imageNamed:@"名片分享_03.png"] forState:UIControlStateNormal];
    [_mingPianShear addTarget:self action:@selector(processMingPianShear) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_mingPianShear];
    
    _callButton = [[UIButton alloc] initWithFrame:CGRectMake(220, 150, 70, 45)];
    [_callButton setImage:[UIImage imageNamed:@"电话_03.png"] forState:UIControlStateNormal];
    [_callButton addTarget:self action:@selector(processCallButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_callButton];
    _SentInformationButton = [[UIButton alloc] initWithFrame:CGRectMake(280, 150, 70, 40)];
    [_SentInformationButton setImage:[UIImage imageNamed:@"短信_03.png"] forState:UIControlStateNormal];
    [_SentInformationButton addTarget:self action:@selector(processSentInformationButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_SentInformationButton];
    _postButton = [[UIButton alloc] initWithFrame:CGRectMake(130, 170, 80, 30)];
    [_postButton setTitle:@"电子邮箱：" forState:UIControlStateNormal];
    [_postButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_postButton addTarget:self action:@selector(processPostButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_postButton];
    _jieChuGuanXi = [[UIButton alloc] initWithFrame:CGRectMake(23, 235, 100, 30)];
    [_jieChuGuanXi setImage:[UIImage imageNamed:@"解除关系_03.png"] forState:UIControlStateNormal];
    [_jieChuGuanXi addTarget:self action:@selector(processJieChuGuanXi) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_jieChuGuanXi];
    _chaKanMingPian = [[UIButton alloc] initWithFrame:CGRectMake(130, 230, 100, 40)];
    [_chaKanMingPian setImage:[UIImage imageNamed:@"查看名片_03.png"] forState:UIControlStateNormal];
    [_chaKanMingPian addTarget:self action:@selector(processChaKanMingPian) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_chaKanMingPian];
    _fangWenWeiuBo = [[UIButton alloc] initWithFrame:CGRectMake(260, 230, 100, 40)];
    [_fangWenWeiuBo setImage:[UIImage imageNamed:@"访问微博_03.png"] forState:UIControlStateNormal];
    [_fangWenWeiuBo addTarget:self action:@selector(processFangWenWeiuBo) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_fangWenWeiuBo];
    
    _detailScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 290, CGGET_WIDTH, CGGET_HEIGHT)];

    
}

- (void)processBackButton
{
    

    
    
}

- (void)processInformationEdit
{
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}
- (void)processMingPianShear
{
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}

- (void)processCallButton
{
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"无该人脉的相关电话" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}

- (void)processSentInformationButton
{
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"无法访问微博，请稍后再试!" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}

- (void)processPostButton
{
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"无法发送信息，请稍后再试!" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}

- (void)processJieChuGuanXi
{
    
}

- (void)processChaKanMingPian
{
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"该人脉没有可显示的名片!" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}

- (void)processFangWenWeiuBo
{
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
