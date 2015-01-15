//
//  KeNengTableViewCell.m
//  LVDIRenMaiManage
//
//  Created by rimi on 15-1-12.
//  Copyright (c) 2015年 Yangxiaofen. All rights reserved.
//

#import "KeNengTableViewCell.h"

@implementation KeNengTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
        _photoImage = [[UIImageView alloc] initWithFrame:CGRectMake(25, 15, 40, 40)];
        _photoImage.layer.cornerRadius = 20;//圆角角度
        _photoImage.clipsToBounds = YES;//圆角显示
        
        [self.contentView addSubview:_photoImage];
        
        _touXiangImage = [[UIImageView alloc]initWithFrame:CGRectMake(65, 25, 20, 20)];
        [self.contentView addSubview:_touXiangImage];
        
        _nameLable = [[UILabel alloc] initWithFrame:CGRectMake(100, 25, 100, 30)];
        _nameLable.textAlignment = NSTextAlignmentLeft;
        _nameLable .font = [UIFont systemFontOfSize:20];

        [self addSubview:_nameLable];
        
        
        _informatiaon = [[UILabel alloc] initWithFrame:CGRectMake(65, 85, 200, 30)];
        _informatiaon .font = [UIFont systemFontOfSize:12];
        _informatiaon.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_informatiaon];
        
        _informatiaonImage = [[UIImageView alloc] initWithFrame:CGRectMake(25, 80, 30, 30)];
        _informatiaonImage.layer.cornerRadius = 15;//圆角角度
        _informatiaonImage.clipsToBounds = YES;//圆角显示
        [self addSubview:_informatiaonImage];
    }
    return self;
    
    
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
