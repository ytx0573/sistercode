//
//  AddContactViewController.m
//  LVDIRenMaiManage
//
//  Created by rimi on 15-1-5.
//  Copyright (c) 2015年 Yangxiaofen. All rights reserved.
//

#import "AddContactViewController.h"

@interface AddContactViewController ()

@end

@implementation AddContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.view setBackgroundColor:[UIColor purpleColor]];
//    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"添加人脉框.png.png"]];
    
    UIImageView * iamge = [[UIImageView alloc] initWithFrame:self.view.bounds];
    iamge.image = [UIImage imageNamed:@"添加人脉框.png.png"];
    [self.view addSubview:iamge];
    
    UIScrollView * scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 80, CGGET_WIDTH, CGGET_HEIGHT)];
    scrollView.contentSize = CGSizeMake(CGGET_WIDTH, CGGET_HEIGHT * 2);
    [self.view addSubview:scrollView];
    [scrollView addSubview:iamge];
    
    
    
    

    // Do any additional setup after loading the view.
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
