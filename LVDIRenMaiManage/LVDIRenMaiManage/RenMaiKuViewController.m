//
//  RenMaiKuViewController.m
//  LVDIRenMaiManage
//
//  Created by rimi on 15-1-5.
//  Copyright (c) 2015年 Yangxiaofen. All rights reserved.
//



#import "TabBarViewController.h"
#import "RenMaiKuViewController.h"

#import "WodeRenmaiTableViewCell.h"

//#import "RenMaiKuTableViewCell.h"
#define CGGET_WIDTH  CGRectGetWidth(self.view.bounds)
#define CGGET_HEIGHT  CGRectGetHeight(self.view.bounds)

@interface RenMaiKuViewController () <UITableViewDataSource,UITableViewDelegate>
{
    TabBarViewController * tabBarController;
    
    NSInteger _index;
    BOOL _isout;
}


@end

@implementation RenMaiKuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _index = -1;
    _isout = 1;
    
    _seachButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 10, 50, 50)];
    [_seachButton setImage:[UIImage imageNamed:@"搜索_03.png"] forState:UIControlStateNormal];
    [self.navc addSubview:_seachButton];
    UIImageView * titleImage = [[UIImageView alloc] initWithFrame:CGRectMake(140, 25, 70, 20)];
    titleImage.image = [UIImage imageNamed:@"人脉库_03.png"];
    [self.navc addSubview:titleImage];
    
    _headView = [[UIView alloc]initWithFrame:CGRectMake(0, 54, CGGET_WIDTH, 44)];
    [self.view addSubview:_headView];
    _waibuRenmaiButton = [[UIButton alloc]initWithFrame:CGRectMake(100, 10, 80, 25)];
    _waibuRenmaiButton.tag = 1;
    _waibuRenmaiButton.selected = YES;
    [_waibuRenmaiButton setImage:[UIImage imageNamed:@"外部未点击_03.png"] forState: UIControlStateNormal];
    [_waibuRenmaiButton setImage:[UIImage imageNamed:@"外部点击_03.png"] forState:UIControlStateSelected];
    [_waibuRenmaiButton addTarget:self action:@selector(processWaiBuRenMaiButton) forControlEvents:UIControlEventTouchUpInside];
    [_headView addSubview:_waibuRenmaiButton];
    
    _neibuRenmaiButton = [[UIButton alloc]initWithFrame:CGRectMake(179, 10, 80, 25)];
    _neibuRenmaiButton.tag = 0;
    [_neibuRenmaiButton setImage:[UIImage imageNamed:@"内部未点击_03.png"] forState:UIControlStateNormal];
    [_neibuRenmaiButton setImage:[UIImage imageNamed:@"内部点击_03.png"] forState:UIControlStateSelected];
    [_neibuRenmaiButton addTarget:self action:@selector(processNeiBuRenMaiButton) forControlEvents:UIControlEventTouchUpInside];
   
    [_headView addSubview:_neibuRenmaiButton];
    
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(-15, 116, CGGET_WIDTH + 20, CGGET_HEIGHT)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //    _tableView.separatorColor = [UIColor cyanColor];
    [self.view addSubview:_tableView];
    
    

    
}

- (void)processWaiBuRenMaiButton
{
    _isout = _waibuRenmaiButton.tag;
    _waibuRenmaiButton.selected = YES;
    _neibuRenmaiButton.selected = NO;
    [_tableView reloadData];

}

- (void)processNeiBuRenMaiButton
{
    _isout = _neibuRenmaiButton.tag;
    _waibuRenmaiButton.selected = NO;
    _neibuRenmaiButton.selected = YES;
    [_tableView reloadData];


}



#pragma mark -- UITableViewDelegate  UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString * cellIndentifier = @"cell";
    WodeRenmaiTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (!cell) {
        cell = [[WodeRenmaiTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }
        
    
    if (_isout) {
        //relate_other_people_list 数据源
        [cell.array addObjectsFromArray:_dataSourcein[indexPath.row][@"relate_other_people_list"]];
        NSLog(@"--------array------%@",_dataSourcein[indexPath.row][@"relate_other_people_list"]);
#pragma mark -- 判断relate_other_people_list是否为空
        if (cell.array.count == 0) {
            cell.detailTableView.hidden = YES;
        } else {
            [cell.detailTableView reloadData];
        }

        NSString * sreingf = _dataSourcein[indexPath.row][@"avatar"];
        cell.photoImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:sreingf]]];
        cell.nameLable.text = _dataSourcein[indexPath.row][@"real_name"];
        cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"背景_03.png"]];
        
        
        if ([_dataSourcein[indexPath.row][@"sex"] intValue] == 0) {
            cell.touXiangImage.image = [UIImage imageNamed:@"男大图_03"];
        }else if ([_dataSourcein[indexPath.row][@"sex"] intValue] == 1)
        {
            cell.touXiangImage.image = [UIImage imageNamed:@"女大图_03"];
        }
        
        [cell.hightChangeButton addTarget:self action:@selector(processhightChange:) forControlEvents:UIControlEventTouchUpInside];
        cell.hightChangeButton.tag = indexPath.row ;
        if (indexPath.row == _index) {
            cell.hightChangeButton.selected = YES;
            cell.lineImage.center = CGPointMake(200, 185);
            cell.hightChangeButton.center = CGPointMake(340, 195);
            cell.detailTableView.frame = CGRectMake(80, 35, 270, 60);
            
        }else{
            cell.hightChangeButton.selected = NO;
            cell.lineImage.center = CGPointMake(200, 105);
            cell.hightChangeButton.center = CGPointMake(340, 105);
            cell.detailTableView.frame = CGRectMake(80, 35, 270, 60);
        }
        return cell;

    }else{
        //relate_other_people_list 数据源
        [cell.array addObjectsFromArray:_dataSourceout[indexPath.row][@"relate_other_people_list"]];
        NSLog(@"--------array------%@",_dataSourceout[indexPath.row][@"relate_other_people_list"]);
        if (cell.array.count == 0) {
            cell.detailTableView.hidden = YES;
        } else {
            [cell.detailTableView reloadData];
        }
        
        NSString * sreingf = _dataSourceout[indexPath.row][@"avatar"];
        cell.photoImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:sreingf]]];
        cell.nameLable.text = _dataSourceout[indexPath.row][@"real_name"];
        cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"背景_03.png"]];
        
        
        if ([_dataSourcein[indexPath.row][@"sex"] intValue] == 0) {
            
        }else if ([_dataSourcein[indexPath.row][@"sex"] intValue] == 1)
        {
            cell.touXiangImage.image = [UIImage imageNamed:@"女大图_03"];;
            
        }else if ([_dataSourcein[indexPath.row][@"sex"] intValue] == 2){
            cell.touXiangImage.image = [UIImage imageNamed:@"男大图_03"];
        }
        
        [cell.hightChangeButton addTarget:self action:@selector(processhightChange:) forControlEvents:UIControlEventTouchUpInside];
        cell.hightChangeButton.tag = indexPath.row ;
        if (indexPath.row == _index) {
            cell.hightChangeButton.selected = YES;
            cell.lineImage.center = CGPointMake(200, 185);
            cell.hightChangeButton.center = CGPointMake(340, 195);
            cell.detailTableView.frame = CGRectMake(80, 35, 270, 60);
            
        }else{
            cell.hightChangeButton.selected = NO;
            cell.lineImage.center = CGPointMake(200, 105);
            cell.hightChangeButton.center = CGPointMake(340, 105);
            cell.detailTableView.frame = CGRectMake(80, 35, 270, 60);
        }
        return cell;
        
    }
    
    
    
}

//按钮调节高度
- (void)processhightChange:(UIButton *)sender
{
    sender.selected = !sender.selected;
    _index = sender.tag;
    if (!sender.selected) {
        _index = -1;
    }
    [_tableView reloadData];
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


//每行高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
        if (indexPath.row != _index) {
            return 120;
        }else{
            return 200;
        }
    
}


- (void)viewDidAppear:(BOOL)animated
{
            NSLog(@"我的人脉请求开始");
        [NetWork postRequest:API_URL parameter:GET_PeopleListOUT completionHander:^(NSURLResponse *response, id responseData, NSError *connectionError) {
            _dataSourcein = [[NSMutableArray alloc] init];
            _dataSourcein = responseData[@"content"][@"people_list"];
          [_tableView reloadData];
            
//            NSLog(@"%@",responseData);
        }];
        [NetWork postRequest:API_URL parameter:GET_PeopleListIN completionHander:^(NSURLResponse *response, id responseData, NSError *connectionError) {
            _dataSourceout = [[NSMutableArray alloc] init];
            _dataSourceout = responseData[@"content"][@"people_list"];
            [_tableView reloadData];
            
//            NSLog(@"%@",responseData);
        }];
    
    
}


@end
