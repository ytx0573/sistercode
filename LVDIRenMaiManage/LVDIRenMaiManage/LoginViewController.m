//
//  LoginViewController.m
//  LVDIRenMaiManage
//
//  Created by rimi on 15-1-8.
//  Copyright (c) 2015年 Yangxiaofen. All rights reserved.
//

#import "LoginViewController.h"
#import "DengluInforCenter.h"

#import "WodeRenmaiTableViewCell.h"
#import "WodeRenMaiViewController.h"

@interface LoginViewController () <UITextFieldDelegate,NetWorkDelegate>



@property (nonatomic,retain)UITextField  * userNameTextField;
@property (nonatomic,retain)UITextField  * passwordTextField;


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"Default-568h@2x 2.png"]]];
    
    UIImageView * denglukuangImag = [[UIImageView alloc] initWithFrame:CGRectMake(60, 200, 250, 200)];
    denglukuangImag.userInteractionEnabled = YES;
    denglukuangImag.image = [UIImage imageNamed:@"登录框_03.png"];
    [self.view addSubview:denglukuangImag];
    
    
    _userNameTextField = [[UITextField alloc] initWithFrame:CGRectMake(60, 50, 170, 30)];
    _userNameTextField.clearButtonMode = UITextFieldViewModeWhileEditing;//清除按钮
    _userNameTextField.placeholder = @"请输入用户名";
    _userNameTextField.textColor = [UIColor colorWithRed:147/255.0 green:179/255.0 blue:57/255.0 alpha:1];
    
    _userNameTextField.returnKeyType = UIReturnKeyDone;
    _userNameTextField.clearsOnBeginEditing = YES;//输入时可清除
    _userNameTextField.delegate = self;
    [denglukuangImag addSubview:_userNameTextField];
    _passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(60, 90, 170, 30)];
    _passwordTextField.secureTextEntry = YES;//安全输入
    _passwordTextField.placeholder = @"请输入密码";
    _passwordTextField.textColor = [UIColor colorWithRed:147/255.0 green:179/255.0 blue:57/255.0 alpha:1];

    _passwordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;//清除按钮
    _passwordTextField.returnKeyType = UIReturnKeyDone;
    _passwordTextField.clearsOnBeginEditing = YES;//输入时可清除
    _passwordTextField.delegate = self;
    [denglukuangImag addSubview:_passwordTextField];
    
    UIButton * remenberPassword = [[UIButton alloc]initWithFrame:CGRectMake(24, 120, 25, 25)];
    [remenberPassword setImage:[UIImage imageNamed:@"选中_03.png"] forState:UIControlStateSelected];
    [remenberPassword setImage:[UIImage imageNamed:@"未选中_03.png"] forState:UIControlStateNormal];
    [remenberPassword addTarget:self action:@selector(processRemeberButton:) forControlEvents:UIControlEventTouchUpInside];
    [denglukuangImag addSubview:remenberPassword];
    
    UIButton * dengluButton = [[UIButton alloc] initWithFrame:CGRectMake(27, 150, 200, 30)];
    [dengluButton setImage:[UIImage imageNamed:@"登录_03 2.png"] forState:UIControlStateNormal];
    [dengluButton addTarget:self action:@selector(processDengluButton) forControlEvents:UIControlEventTouchUpInside];
    [denglukuangImag addSubview:dengluButton];
    
}



- (void)processRemeberButton:(UIButton *)sender
{
    sender.selected = !sender.selected;
}

- (void)processDengluButton
{
    
//    if ((_userNameTextField.text.length > 4 && _userNameTextField.text.length <= 10) && (_passwordTextField.text.length > 4 && _passwordTextField.text.length <= 10)) {
//        NSLog(@"开始请求");
    
        NSString * string = API_URL;
        NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
        [dictionary setObject:@"ApiGGC" forKey:@"g"];
        [dictionary setObject:@"Public" forKey:@"m"];
        [dictionary setObject:@"login" forKey:@"c"];
        
//        [dictionary setObject:_userNameTextField.text forKey:@"user_name"];
//        [dictionary setObject:_passwordTextField.text forKey:@"password"];
        [dictionary setObject:@"class9" forKey:@"user_name"];
        [dictionary setObject:@"class9" forKey:@"password"];
    
#pragma mark -----登录请求
   
    
        [NetWork postRequest:string parameter:dictionary completionHander:^(NSURLResponse *response, id responseData, NSError *connectionError) {
            NSLog(@"%@",responseData);  
            
            if ([responseData[@"status"]  intValue] == 1)  {
                 [DengluInforCenter sharedDengluInforCenter].isLogin = YES;
                [self dismissViewControllerAnimated:YES completion:nil];
                _complte ? _complte() : self;
                NSLog(@"登录成功");
            
            }else if ([responseData[@"status"]  intValue] == 1){
            [self alertWithMessage:@"登录失败"];
            }
        }];
    
//    }else if (_userNameTextField.text.length <= 0){
//        [self alertWithMessage:@"账号不能为空"];
//    }else if (_passwordTextField.text.length <= 0){
//        [self alertWithMessage:@"密码不能为空"];
//    }

    
    
//        NetWork * netWorkManage = [[NetWork alloc] init];
//        [netWorkManage setDelegate:self];
//        [netWorkManage sendPostRequestWithURLString:string dictionary:dictionary];
    
    
    
}



- (void)alertWithMessage:(NSString *)message
{
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:message delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}

#pragma mark --  <UITextFieldDelegate>
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    return YES;
}
- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    return YES;
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    return YES;
}


- (void)drawPlaceholderInRect:(CGRect)rect
{
    
}



#pragma mark -- <NetWorkDelegate>
- (void)requestFinishedWithData:(id)object
{
     NSLog(@"代理传值：%@", object);
}
- (void)requestFaildWithdescription:(NSString *)description
{
    NSLog(@"传值失败%@", description);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
