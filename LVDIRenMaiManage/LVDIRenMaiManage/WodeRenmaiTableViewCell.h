//
//  WodeRenmaiTableViewCell.h
//  LVDIRenMaiManage
//
//  Created by rimi on 15-1-7.
//  Copyright (c) 2015年 Yangxiaofen. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WodeRenMaiTableViewCellDelegate <NSObject>



@end


@interface WodeRenmaiTableViewCell : UITableViewCell<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,retain)UIImageView * photoImage;
@property (nonatomic,retain)UIImageView * touXiangImage;
@property (nonatomic,retain)UILabel * nameLable;
@property (nonatomic,retain)UIImageView * lineImage;
@property (nonatomic,retain)UITableView * detailTableView;
@property (nonatomic,retain)NSMutableArray * array;//数据源


@property (nonatomic,retain)UIButton * hightChangeButton;
@property (nonatomic,assign) id <WodeRenMaiTableViewCellDelegate> delegate;
@property (nonatomic,assign) BOOL flag;

@property (nonatomic,copy) void(^hightChanged)(void);



@end
