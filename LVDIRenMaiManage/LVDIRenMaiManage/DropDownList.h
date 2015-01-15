//
//  DropDownList.h
//  LVDIXIANGMU
//
//  Created by rimi on 15-1-13.
//  Copyright (c) 2015年 龙桂英. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DropDownList : UIView
@property(nonatomic,retain)UITableView * listTableView;
@property(nonatomic,retain)NSMutableArray * contantArray;
@property(nonatomic,retain)UITextField * textField;


- (void)reloadData;

@end
