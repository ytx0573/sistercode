//
//  RenMaiKuViewController.h
//  LVDIRenMaiManage
//
//  Created by rimi on 15-1-5.
//  Copyright (c) 2015年 Yangxiaofen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface RenMaiKuViewController : ViewController

@property (nonatomic,retain)UIButton * seachButton;

@property (nonatomic,retain)UITableView * tableView;
@property (nonatomic,retain)UIView * headView;//表格头
@property (nonatomic,retain)UIButton * waibuRenmaiButton;//外部人脉按钮
@property (nonatomic,retain)UIButton * neibuRenmaiButton;//内部人脉按钮

@property (nonatomic,retain)NSMutableArray * dataSourcein;
@property (nonatomic,retain)NSMutableArray * dataSourceout;




@end
