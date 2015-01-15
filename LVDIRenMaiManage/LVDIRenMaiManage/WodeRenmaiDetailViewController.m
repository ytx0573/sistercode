//
//  WodeRenmaiDetailViewController.m
//  LVDIRenMaiManage
//
//  Created by Johnson on 1/12/15.
//  Copyright (c) 2015 Yangxiaofen. All rights reserved.
//

#import "WodeRenmaiDetailViewController.h"

@interface WodeRenmaiDetailViewController ()
@property (nonatomic,retain)UIImageView * mingPianView;
@property (nonatomic,retain)UIImageView * touxiangImage;
@property (nonatomic,retain)UIButton * informationButtion;
@property (nonatomic,retain)UIButton * shearButtion;
@property (nonatomic,retain)UIButton * chakanMingpianButtion;
@property (nonatomic,retain)UIButton * fagnwenButtion;



@end

@implementation WodeRenmaiDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _mingPianView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 10, 300, 250)];
    _mingPianView.image = [UIImage imageNamed:@"人脉详情_卡片.png"];
    [self.view addSubview:_mingPianView];
    
    
    _chakanMingpianButtion = [[UIButton alloc] initWithFrame:CGRectMake(150, 200, 100, 30)];
    [_chakanMingpianButtion setImage:[UIImage imageNamed:@"查看名片_03.png"] forState:UIControlStateNormal];
    
    


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
