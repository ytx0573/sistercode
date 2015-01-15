//
//  WodeRenMaiViewController.m
//  LVDIRenMaiManage
//
//  Created by rimi on 15-1-5.
//  Copyright (c) 2015年 Yangxiaofen. All rights reserved.
//

#import "WodeRenmaiTableViewCell.h"
#import "ShijianZhouTableViewCell.h"

#import "DengluInforCenter.h"
#import "LoginViewController.h"
#import "WodeRenmaiDetailVC.h"

#import "RenMaiKuViewController.h"
#import "SeacherViewController.h"



@interface WodeRenMaiViewController () <UITableViewDataSource,UITableViewDelegate,WodeRenMaiTableViewCellDelegate,NetWorkDelegate>
{
    UIView * _seacherView;                    //我的人脉收索视图
    UIImageView * _addContactView;            //添加人脉视图
    UIView * _shijinazhouView;                //时间轴
    TabBarViewController * tabBarController;  //   自定义cell
    WodeRenmaiTableViewCell * _cell;         //  大 自定义cell

    NSMutableArray * _dataArray;
    LoginViewController * _loginView;
    NSInteger _index;
    BOOL _isWoDeRenMai;
}

@property(nonatomic ,retain)UITextField * guanJianZiLable;
@property(nonatomic,retain)UIButton * hangYeButton;
@property(nonatomic,retain)UIButton * zhiWuButton;
@property(nonatomic,retain)UIButton * shengButton;
@property(nonatomic,retain)UIButton * shiButton;


@property (nonatomic,retain)UITableView * wodeRenmaiListView;//大 我的人脉列表
@property (nonatomic,retain)UITableView * shijianZhouTableView;
@property (nonatomic,retain)UIImageView * titleView;//导航栏标题
@property (nonatomic,retain)UIButton * seachButton;//收索人脉按钮
@property (nonatomic,retain)UIButton * addContactButton;//添加人脉按钮
@property (nonatomic,retain)UIView * headView;//表格头
@property (nonatomic,retain)UIButton * wodeRenmaiButton;//我的人脉
@property (nonatomic,retain)UIButton * shijianzhouButton;//时间轴

@property (nonatomic,retain)NSMutableArray * woDeRenMaiDataSource;//数据源
@property (nonatomic,retain)NSMutableArray * shiJianZhouDataSource;//数据源






@end

@implementation WodeRenMaiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _index = -1;
    _isWoDeRenMai = 0;;

    _seachButton = [[UIButton alloc]initWithFrame:CGRectMake(20, 10, 50, 50)];
    [_seachButton setImage:[UIImage imageNamed:@"搜索_03.png"] forState:UIControlStateNormal];
    [_seachButton addTarget:self action:@selector(processSeachButton) forControlEvents:UIControlEventTouchUpInside];
    
    _addContactButton = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.view.bounds) - 60, 10, 50, 50)];
    [_addContactButton setImage:[UIImage imageNamed:@"新增人脉_03.png"] forState:UIControlStateNormal];
    [_addContactButton addTarget:self action:@selector(processAddContactButton) forControlEvents:UIControlEventTouchUpInside];
    
    _titleView = [[UIImageView alloc] initWithFrame:CGRectMake(140, 25, 80, 20)];
    _titleView.image = [UIImage imageNamed:@"我的人脉_03.png"];
    [self.navc addSubview:_titleView];
    
    [self.view addSubview:_seachButton];
    [self.view addSubview:_addContactButton];
    
    _headView = [[UIView alloc]initWithFrame:CGRectMake(0, 54, CGGET_WIDTH, 62)];
    [self.view addSubview:_headView];
    
    UIImageView * fengexianView = [[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(_headView.bounds)- 18, CGGET_WIDTH, 18)];
    fengexianView.image = [UIImage imageNamed:@"分割线_03.png"];
    [_headView addSubview:fengexianView];
    _wodeRenmaiButton = [[UIButton alloc]initWithFrame:CGRectMake(100, 10, 80, 20)];
    _shijianzhouButton = [[UIButton alloc]initWithFrame:CGRectMake(180, 10, 80, 20)];
    [_wodeRenmaiButton setImage:[UIImage imageNamed:@"我的人脉未点击11_03.png"] forState:UIControlStateNormal];
    [_wodeRenmaiButton setImage:[UIImage imageNamed:@"我的人脉点击11_03.png"] forState:UIControlStateSelected];
    [_shijianzhouButton setImage:[UIImage imageNamed:@"时间轴未点击_03.png"] forState:UIControlStateNormal];
    [_shijianzhouButton setImage:[UIImage imageNamed:@"时间轴点击_03.png"] forState:UIControlStateSelected];
    [_wodeRenmaiButton addTarget:self action:@selector(processWodeRenmaiButton) forControlEvents:UIControlEventTouchUpInside];
    [_shijianzhouButton addTarget:self action:@selector(processShiJianZhouButton) forControlEvents:UIControlEventTouchUpInside];
    _wodeRenmaiButton.selected = YES;
    [_headView addSubview:_wodeRenmaiButton];
    [_headView addSubview:_shijianzhouButton];
    
    
    
    _wodeRenmaiListView = [[UITableView alloc] initWithFrame:CGRectMake(-15, 116, CGGET_WIDTH + 20, CGGET_HEIGHT-209)];
    [_wodeRenmaiListView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"背景_03.png"]]];
    _wodeRenmaiListView.delegate = self;
    _wodeRenmaiListView.dataSource = self;
    _wodeRenmaiListView.rowHeight = 200;
    _wodeRenmaiListView.showsVerticalScrollIndicator = YES;
    _wodeRenmaiListView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_wodeRenmaiListView];
    
#pragma mark == 时间轴
    
    _shijinazhouView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(_headView.bounds) + 30, CGGET_WIDTH, CGGET_HEIGHT)];
    _shijinazhouView.userInteractionEnabled = YES;
    [self.view addSubview:_shijinazhouView];
    _shijinazhouView.hidden = YES;
    UIImageView * beijingImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGGET_WIDTH, 140)];
    beijingImage.image = [UIImage imageNamed:@"大头像_02.png"];
    [_shijinazhouView addSubview:beijingImage];
    
    
    UIImageView * myTouXiang = [[UIImageView alloc] initWithFrame:CGRectMake(50, 130, 60, 60)];
    myTouXiang.layer.cornerRadius = 30;
    myTouXiang.image = [UIImage imageNamed:@"头像_03.png"];
    [_shijinazhouView addSubview:myTouXiang];
    
    UIButton * xianShiQuanBuButton = [[UIButton alloc] initWithFrame:CGRectMake(150, 150, 100, 30)];
    [xianShiQuanBuButton setImage:[UIImage imageNamed:@"显示全部_03.png"] forState:UIControlStateNormal];
    [xianShiQuanBuButton addTarget:self action:@selector(processXianShiQuanBuButton) forControlEvents:UIControlEventTouchUpInside];
    [_shijinazhouView addSubview:xianShiQuanBuButton];
    
    _shijianZhouTableView = [[UITableView alloc] initWithFrame:CGRectMake( 0, 200, CGGET_WIDTH, 300)];
    _shijianZhouTableView.separatorColor = [UIColor grayColor];
    _shijianZhouTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    _shijianZhouTableView.showsVerticalScrollIndicator = YES;
    _shijianZhouTableView.delegate = self;
    _shijianZhouTableView.dataSource = self;
    [_shijinazhouView addSubview:_shijianZhouTableView];
    
    
#pragma mark ----------------------------------- 我的人脉收索视图-----------------------
  
    _seacherView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, CGGET_HEIGHT)];
    _seacherView.center = CGPointMake(- (CGRectGetMidX(self.view.bounds) - 28), CGRectGetMidY(self.view.bounds));
    _seacherView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"搜索背景_02_02.png"]];
    [self.tabBarController.view addSubview:_seacherView];
    

    UIImageView * seacherViewTitle = [[UIImageView alloc] initWithFrame:CGRectMake(30, 20, 130, 30)];
    seacherViewTitle.image = [UIImage imageNamed:@"我的人脉搜索_03.png"];
    [seacherViewTitle setUserInteractionEnabled:YES];
    [_seacherView addSubview:seacherViewTitle];
    
    UIButton * cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(CGGET_WIDTH - 150, 20, 50, 20)];
    [cancelButton setImage:[UIImage imageNamed:@"取消_03.png"] forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(processCancelButton) forControlEvents:UIControlEventTouchUpInside];
    [_seacherView addSubview:cancelButton];
    
    
    UIButton * seachViewSeachButton = [[UIButton alloc]initWithFrame:CGRectMake(5, 400, 150, 40)];
    [seachViewSeachButton setFrame:CGRectMake(5, 400, 150, 40)];
    [seachViewSeachButton setImage:[UIImage imageNamed:@"搜索按钮_03.png"] forState:UIControlStateNormal];
    [seachViewSeachButton addTarget:self action:@selector(processseachViewSeachButton) forControlEvents:UIControlEventTouchUpInside];
    
    [_seacherView addSubview:seachViewSeachButton];
    
    UIButton * seachViewChongzhiButton = [[UIButton alloc]initWithFrame:CGRectMake(160, 400, 150, 50)];
    [seachViewChongzhiButton setImage:[UIImage imageNamed:@"重置按钮_03.png"] forState:UIControlStateNormal];
    
    [seachViewChongzhiButton addTarget:self action:@selector(processSeachViewChongzhiButton) forControlEvents:UIControlEventTouchUpInside];
    
    [_seacherView addSubview:seachViewChongzhiButton];
    
    
}



#pragma make ------------- selfView   processs
- (void)processSeachButton
{
    
   [UIView animateWithDuration:0.5 animations:^{
        [(TabBarViewController *)[[[[UIApplication sharedApplication] delegate] window] rootViewController] setTabBarHidden:YES];
        [tabBarController didMoveToParentViewController:self];
        self.view.center = CGPointMake(CGRectGetMidX(self.view.bounds) * 2.6, CGRectGetMidY(self.view.bounds));
       _seacherView.center = CGPointMake(140, CGRectGetMidY(self.view.bounds));
   }];
//    SeacherViewController * seachVC = [[SeacherViewController alloc] init];
//    [self.navigationController pushViewController:seachVC animated:YES];
    
}


- (void)processAddContactButton
{
    AddContactViewController * addContactView = [[AddContactViewController alloc] init];
    [self.navigationController setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    [self.navigationController pushViewController:addContactView animated:YES];
    
}

- (void)processWodeRenmaiButton
{
    _titleView.image = [UIImage imageNamed:@"我的人脉_03.png.png"];
    _titleView.frame = CGRectMake(140, 20, 80, 20);
    _wodeRenmaiButton.selected = YES;
    _shijianzhouButton.selected = NO;
    _shijinazhouView.hidden = YES;
    _wodeRenmaiListView.hidden = NO;


}

- (void)processShiJianZhouButton
{
    _titleView.image = [UIImage imageNamed:@"时间轴_03.png"];
    _titleView.frame = CGRectMake(145, 20, 70, 20);
    _shijianzhouButton.selected = YES;
    _wodeRenmaiButton.selected = NO;
    _shijinazhouView.hidden = NO;
    _wodeRenmaiListView.hidden = YES;
    
}

- (void)processXianShiQuanBuButton
{
    WodeRenmaiDetailVC * renmaiXiangqing = [[WodeRenmaiDetailVC alloc] init];
    [self.navigationController pushViewController:renmaiXiangqing animated:YES];
}

#pragma mark ----------- SeachVC Process
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


#pragma mark -------- <UITableViewDataSource,UITableViewDelegate>---------

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([tableView isEqual:_wodeRenmaiListView]) {
        return _woDeRenMaiDataSource.count;
    }else{
//        return _shiJianZhouDataSource.count;
        return 4;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([tableView isEqual:_wodeRenmaiListView]) {
        static NSString * cellIndentifier = @"cell";
        _cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
        if (!_cell) {
            _cell = [[WodeRenmaiTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
        }
        
#pragma mark --         relate_other_people_list 数据源
        [_cell.array addObjectsFromArray:_woDeRenMaiDataSource[indexPath.row][@"relate_other_people_list"]];
//        NSLog(@"--------array------%@",_woDeRenMaiDataSource[indexPath.row][@"relate_other_people_list"]);
        if (_cell.array.count == 0) {
            _cell.detailTableView.hidden = YES;
        } else {
            [_cell.detailTableView reloadData];
        }

        NSString * sreingf = _woDeRenMaiDataSource[indexPath.row][@"avatar"];
        _cell.photoImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:sreingf]]];
        _cell.nameLable.text = _woDeRenMaiDataSource[indexPath.row][@"real_name"];
        _cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"背景_03.png"]];
        
        if ([_woDeRenMaiDataSource[indexPath.row][@"sex"] intValue] == 0) {
            _cell.touXiangImage.image = [UIImage imageNamed:@"女大图_03"];;
        }else if ([_woDeRenMaiDataSource[indexPath.row][@"sex"] intValue] == 1)
        {
            _cell.touXiangImage.image = [UIImage imageNamed:@"女大图_03"];;
            
        }else if ([_woDeRenMaiDataSource[indexPath.row][@"sex"] intValue] == 2){
            _cell.touXiangImage.image = [UIImage imageNamed:@"男大图_03"];
        }

               
        [_cell.hightChangeButton addTarget:self action:@selector(processhightChangeButton:) forControlEvents:UIControlEventTouchUpInside];
        _cell.hightChangeButton.tag = indexPath.row ;
        if (indexPath.row == _index) {
            _cell.hightChangeButton.selected = YES;
            _cell.lineImage.center = CGPointMake(200, 185);
            _cell.hightChangeButton.center = CGPointMake(360, 195);
            _cell.detailTableView.frame = CGRectMake(80, 35, 300, 60);
            
        }else{
            _cell.hightChangeButton.selected = NO;
            _cell.lineImage.center = CGPointMake(200, 105);
            _cell.hightChangeButton.center = CGPointMake(360, 105);
            _cell.detailTableView.frame = CGRectMake(80, 35, 300, 60);
        }
        return _cell;

    }else
    {
#pragma mark  ==  时间轴
         static NSString * string = @"time";
        ShijianZhouTableViewCell * TimeCell = [tableView dequeueReusableCellWithIdentifier:string];
        if (!TimeCell) {
            TimeCell = [[ShijianZhouTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
        }
//        TimeCell.timeLable.text = @"dfgdgf";
        return TimeCell;
    }
    
}

- (void)processhightChangeButton:(UIButton *)sender
{
    sender.selected = !sender.selected;
    _index = sender.tag;
    if (!sender.selected) {
        _index = -1;
    }
    [_wodeRenmaiListView reloadData];             //对cell的操作后每次都要刷新 刷新 刷新
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
//每行高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    if ([tableView isEqual:_wodeRenmaiListView]) {
        if (indexPath.row != _index) {
            return 120;
        }else
        {
            return 200;
        }

    }else{
        return 80;
    }
    
}


#pragma mark -----------------------------------------登录页面跳转-----------------------
- (void)viewDidAppear:(BOOL)animated
{

    if (![DengluInforCenter sharedDengluInforCenter].isLogin) {
        LoginViewController * loginVC = [[LoginViewController alloc] init];
#pragma mark 接收已登录通知 开始我的人脉请求 保存并更新数据
        loginVC.complte = ^(){
            NSLog(@"我的人脉请求开始");
            [NetWork postRequest:API_URL parameter:GET_MyPeopleList completionHander:^(NSURLResponse *response, id responseData, NSError *connectionError) {
                _woDeRenMaiDataSource = [[NSMutableArray alloc] init];
                _woDeRenMaiDataSource = responseData[@"content"][@"people_list"];
                [_wodeRenmaiListView reloadData];
                
                NSLog(@"%@",responseData);
             }];
        };
    
        [self presentViewController:loginVC animated:YES completion:nil];
       
//        [NetWork postRequest:API_URL parameter:GET_PeopleListIN completionHander:^(NSURLResponse *response, id responseData, NSError *connectionError) {
//            _shiJianZhouDataSource = [[NSMutableArray alloc] init];
//            _shiJianZhouDataSource = responseData[@"content"][@"people_list"];
////            [_shijianZhouTableView reloadData];
//        }];
    
}


}







@end
