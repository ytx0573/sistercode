//
//  littleTableViewCell.m
//  LVDIRenMaiManage
//
//  Created by rimi on 15-1-9.
//  Copyright (c) 2015年 Yangxiaofen. All rights reserved.
//

#import "littleTableViewCell.h"

@implementation littleTableViewCell





- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        
        _photoImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, 20, 20)];
        _photoImage.layer.cornerRadius = 10;//圆角角度
        _photoImage.clipsToBounds = YES;//圆角显示
        [self.contentView addSubview:_photoImage];
        
        _nameLable = [[UILabel alloc] initWithFrame:CGRectMake(40, 3, 100, 15)];
        _nameLable.textAlignment = NSTextAlignmentLeft;
        _nameLable.font = [UIFont systemFontOfSize:13];
        _nameLable.textColor = [UIColor colorWithRed:147/255.0 green:179/255.0 blue:57/255.0 alpha:1];
//        if (_nameLable.text characterAtIndex:<#(NSUInteger)#>) {
//            <#statements#>
//        }

        [self addSubview:_nameLable];

//        _guanxiLable = [[UILabel alloc] initWithFrame:CGRectMake(100, 3, 40, 15)];
//        _guanxiLable.textAlignment = NSTextAlignmentLeft;
//        _guanxiLable.font = [UIFont systemFontOfSize:12];
//        [self addSubview:_guanxiLable];
        
        _pentagramImage = [[UIImageView alloc]initWithFrame:CGRectMake(130, 3, 15, 15)];
        [self.contentView addSubview:_pentagramImage];
        
        _chongyaoLable = [[UILabel alloc] initWithFrame:CGRectMake(150, 3, 50, 15)];
        _chongyaoLable.textAlignment = NSTextAlignmentLeft;
        _chongyaoLable.font = [UIFont systemFontOfSize:12];
        [self addSubview:_chongyaoLable];
        
        _peachPentagramImage = [[UIImageView alloc] initWithFrame:CGRectMake(210, 3, 15, 14)];
        [self.contentView addSubview:_peachPentagramImage];
        
        _qinmiLable = [[UILabel alloc] initWithFrame:CGRectMake(230, 3, 50, 15)];
        _qinmiLable.textAlignment = NSTextAlignmentLeft;
        _qinmiLable.font = [UIFont systemFontOfSize:12];
        [self addSubview:_qinmiLable];

        
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
