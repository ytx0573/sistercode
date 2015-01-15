//
//  KeNengViewController.m
//  LVDIRenMaiManage
//
//  Created by rimi on 15-1-5.
//  Copyright (c) 2015年 Yangxiaofen. All rights reserved.
//

#import "KeNengViewController.h"
#import "KeNengTableViewCell.h"

@interface KeNengViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,retain)UITableView * tableView;
@property (nonatomic,retain)NSMutableArray * dataSource;

@end

@implementation KeNengViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIImageView * titleImage = [[UIImageView alloc] initWithFrame:CGRectMake(130, 25, 130, 20)];
    titleImage.image = [UIImage imageNamed:@"可能认识的人_03.png"];
    [self.navc addSubview:titleImage];
    
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 65, CGGET_WIDTH, CGGET_HEIGHT)];
//    _tableView.separatorColor = [UIColor clearColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];

    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

#pragma mark -- 每一行  ************************* 注意
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataSource count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString * cellIndentifier = @"cell";
    KeNengTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (!cell) {
        cell = [[KeNengTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }
    cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"背景_03.png"]];
    NSString * sreingf = _dataSource[indexPath.row][@"avatar"];
    cell.photoImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:sreingf]]];
    cell.nameLable.text = _dataSource[indexPath.row][@"real_name"];
    if ([_dataSource[indexPath.row][@"sex"] intValue] == 0) {
        
    }else if ([_dataSource[indexPath.row][@"sex"] intValue] == 1)
    {
        cell.touXiangImage.image = [UIImage imageNamed:@"女大图_03"];;
        
    }else if ([_dataSource[indexPath.row][@"sex"] intValue] == 2){
        cell.touXiangImage.image = [UIImage imageNamed:@"男大图_03"];
    }
    
    cell.informatiaon.text = _dataSource[indexPath.row][@"relate_by_peoples_list"][0][0][@"real_name"];
    cell.informatiaonImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:_dataSource[indexPath.row][@"relate_by_peoples_list"][0][0][@"avatar"]]]];
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return 150;
}


- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"我的人脉请求开始");
    [NetWork postRequest:API_URL parameter:GET_MayKonwPeopleList completionHander:^(NSURLResponse *response, id responseData, NSError *connectionError) {
        _dataSource = [[NSMutableArray alloc]initWithArray:responseData[@"content"][@"may_know_people_list"]];
        [_tableView reloadData];
        NSLog(@"%@",_dataSource);
        NSLog(@"**********%@",responseData);
    }];
    
    
}



@end
