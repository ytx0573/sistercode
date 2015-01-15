//
//  ShijianZhouTableViewCell.m
//  LVDIRenMaiManage
//
//  Created by rimi on 15-1-10.
//  Copyright (c) 2015年 Yangxiaofen. All rights reserved.
//

#import "ShijianZhouTableViewCell.h"

@implementation ShijianZhouTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
    
        UIImageView * line = [[UIImageView alloc] initWithFrame:CGRectMake(100, 0, 14, 100)];
        line.image = [UIImage imageNamed:@"线_03.png"];
        [self.contentView addSubview:line];
        
        
        _touxiang = [[UIImageView alloc] initWithFrame:CGRectMake(40, 20, 40, 40)];
        _touxiang.layer.cornerRadius = 20;//圆角角度
        _touxiang.clipsToBounds = YES;//圆角显示
        _touxiang.image = [UIImage imageNamed:@"123.png"];
        [self.contentView addSubview:_touxiang];
        
        _logeImage = [[UIImageView alloc]initWithFrame:CGRectMake(94, 25, 30, 30)];
        [self.contentView addSubview:_logeImage];
        _logeImage.image = [UIImage imageNamed:@"1_03.png"];
        
        _inforMationLable = [[UILabel alloc] initWithFrame:CGRectMake(150, 20, 100, 20)];
        _inforMationLable.textAlignment = NSTextAlignmentLeft;
        _inforMationLable.text = @"34434343";
        [self addSubview:_inforMationLable];
        
        _timeLable.backgroundColor = [UIColor blackColor];
        _timeLable = [[UILabel alloc] initWithFrame:CGRectMake(150, 50, 100, 15)];
        _timeLable.textAlignment = NSTextAlignmentLeft;
        _timeLable.text = @"ppppppppppp";
        [self addSubview:_timeLable];
        
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
