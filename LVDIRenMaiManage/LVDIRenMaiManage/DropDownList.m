//
//  DropDownList.m
//  LVDIXIANGMU
//
//  Created by rimi on 15-1-13.
//  Copyright (c) 2015年 龙桂英. All rights reserved.
//

#define DEGREES_TO_RADIANS(angle) ((angle)/180.0 *M_PI)


#import "DropDownList.h"

@interface DropDownList ()<UITableViewDataSource,UITableViewDelegate>
{
    
    BOOL _showList; //是否弹出下拉列表
    CGFloat _tableHeight;//table下拉列表的高度
    CGFloat _frameHeight;//frame的高度
    
    UIImageView * _arrowView;
    
    UILabel * _titleLabel;
}

@end

@implementation DropDownList
@synthesize listTableView,contantArray,textField;

- (void)dealloc
{
    [listTableView release];
    [textField     release];
    [contantArray  release];
    
    [super dealloc];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (frame.size.height < 200) {
        _frameHeight = 200;
    } else {
        _frameHeight = frame.size.height;
    }
    _tableHeight = _frameHeight - 30;
    frame.size.height = 30.0f;
    self = [super initWithFrame:frame];
    if (self) {
        
        contantArray = [[NSMutableArray alloc] init];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.layer.borderColor = [UIColor colorWithRed:226/255.0 green:226/255.0 blue:226/255.0 alpha:1].CGColor;

        btn.layer.borderWidth = 0.5;
        btn.clipsToBounds = YES;
        btn.layer.masksToBounds = YES;
        btn.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        [btn addTarget:self action:@selector(dropDown) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, 30)];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.layer.borderWidth = 1;
        _titleLabel.layer.borderColor = [UIColor colorWithRed:226/255.0 green:226/255.0 blue:226/255.0 alpha:1].CGColor;

        _titleLabel.textAlignment = NSTextAlignmentLeft;
        //_titleLabel.textColor = kTextColor;
        [btn addSubview:_titleLabel];
        
        _showList = NO; //默认不显示下拉框
        
        listTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 30, frame.size.width, 0)];
        listTableView.delegate = self;
        listTableView.dataSource = self;
        listTableView.separatorColor = [UIColor lightGrayColor];
        listTableView.hidden = YES;
        [self addSubview:listTableView];
        
        CGRect textFrame = _titleLabel.frame;

        _arrowView = [[UIImageView alloc] initWithFrame:CGRectMake(textFrame.size.width - 20, 10, 10, 10)];
        _arrowView.contentMode = UIViewContentModeScaleToFill;
        _arrowView.image = [UIImage imageNamed:@"三角_03.png"];
        [btn addSubview:_arrowView];
        
    }
    return self;

}

- (void)dropDown
{
    if (_showList) {
        
        [UIView animateWithDuration:0.3 animations:^{
            CGRect frame = listTableView.frame;
            frame.size.height = 0;
            [listTableView setFrame:frame];
            
        } completion:^(BOOL finished){
            _showList = NO;
          _arrowView.transform = CGAffineTransformRotate(_arrowView.transform, DEGREES_TO_RADIANS(180));
        }];
    
    } else {
        [UIView animateWithDuration:0.3 animations:^{
            CGRect selfFrame = self.frame;
            selfFrame.size.height = _frameHeight;
            
            [self.superview bringSubviewToFront:self];
            listTableView.hidden = NO;
            _showList = YES;
            
            CGRect tableFrame = listTableView.frame;
            tableFrame.size.height = 0;
            listTableView.frame = tableFrame;
            tableFrame.size.height = _tableHeight;
            self.frame = selfFrame;
            listTableView.frame = tableFrame;
        
        } completion:^(BOOL finished){
            _showList = YES;

             _arrowView.transform = CGAffineTransformRotate(_arrowView.transform, DEGREES_TO_RADIANS(180));
        }];
    
        
    }
}

#pragma mark -- <UITableViewDataSource,UITableViewDelegate>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView

{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
return [contantArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

static NSString * cellIndentifier = @"cell12454";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
        
    }
    cell.textLabel.text = [contantArray objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:16];
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30;

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    _titleLabel.text = [contantArray objectAtIndex:indexPath.row];
    _showList = NO;
    listTableView.hidden = YES;
    [listTableView reloadData];
    
    CGRect selfFrame = self.frame;
    selfFrame.size.height = 30;
    self.frame = selfFrame;
    
    CGRect tableFrame = listTableView.frame;
    tableFrame.size.height = 0;
    listTableView.frame = tableFrame;
    _arrowView.transform = CGAffineTransformIdentity;

}

- (void)reloadData
{
    [listTableView reloadData];
}



@end
