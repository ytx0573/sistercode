//
//  WodeRenmaiTableViewCell.m
//  LVDIRenMaiManage
//
//  Created by rimi on 15-1-7.
//  Copyright (c) 2015年 Yangxiaofen. All rights reserved.
//

#import "WodeRenmaiTableViewCell.h"
#import "littleTableViewCell.h"


@implementation WodeRenmaiTableViewCell

/**自定义cell要重写并调用的方法
 且自定义的方法里地东西的fram不能用self.view.bouns
 */
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
     
    
        _photoImage = [[UIImageView alloc] initWithFrame:CGRectMake(25, 0, 40, 40)];
        _photoImage.layer.cornerRadius = 20;//圆角角度
        _photoImage.clipsToBounds = YES;//圆角显示
        
        [self.contentView addSubview:_photoImage];
        
        _touXiangImage = [[UIImageView alloc]initWithFrame:CGRectMake(65, 7, 20, 20)];
        [self.contentView addSubview:_touXiangImage];
        
        _nameLable = [[UILabel alloc] initWithFrame:CGRectMake(100, 7, 100, 30)];
        _nameLable.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_nameLable];
        
        _detailTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
        _detailTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _detailTableView.separatorColor = [UIColor clearColor];
        _detailTableView.delegate = self;//  代理      代理      cell里的东西要遵守协议且设置代理
        _detailTableView.dataSource = self;
        [self.contentView addSubview:_detailTableView];
    
        
        _lineImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 400, 14)];
        _lineImage.image = [UIImage imageNamed:@"线_02.png"];
        [self.contentView addSubview:_lineImage];
        
        
        _hightChangeButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
        [_hightChangeButton setBackgroundImage:[UIImage imageNamed:@"1_03 2.png"] forState:UIControlStateNormal];
        [_hightChangeButton setBackgroundImage:[UIImage imageNamed:@"2_03 2.png"] forState:UIControlStateSelected];
        [self.contentView addSubview:_hightChangeButton];
        
        
        _array = [[NSMutableArray alloc]init];
    
    }
    return self;
    
    
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _array.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString * cellIndentifier = @"cell";
    littleTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (!cell) {
        cell = [[littleTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }
    
       cell.photoImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:_array[indexPath.row][@"avatar"]]]];
    cell.nameLable.text = [NSString stringWithFormat:@"%@ 的%@",_array[indexPath.row][@"real_name"],_array[indexPath.row][@"relation_type"]];
//        cell.nameLable.text = _array[indexPath.row][@"real_name"];
//        cell.guanxiLable.text = [NSString stringWithFormat:@"的%@",_array[indexPath.row][@"relation_type"]];
        if ([_array[indexPath.row][@"importance"] intValue] == 1 ) {
            cell.pentagramImage.image = [UIImage imageNamed:@"不重要_03.png"];
            cell.chongyaoLable.text = @"不重要";

        }else if ([_array[indexPath.row][@"importance"] intValue] == 2){
            cell.pentagramImage.image = [UIImage imageNamed:@"重要_03.png"];
            cell.chongyaoLable.text = @"重要";
        }else if ([_array[indexPath.row][@"importance"] intValue] == 3){
            cell.pentagramImage.image = [UIImage imageNamed:@"一般重要_03.png"];
            cell.chongyaoLable.text = @"一般重要";
        }else if ([_array[indexPath.row][@"importance"] intValue] == 4){
            cell.pentagramImage.image = [UIImage imageNamed:@"非常重要_03.png"];
            cell.chongyaoLable.text = @"非常重要";
        }else{
            cell.pentagramImage.image = nil;
        }
        
        cell.qinmiLable.text = _array[indexPath.row][@"relationship"];
    
        if ([cell.qinmiLable.text intValue] == 1 ) {
            cell.peachPentagramImage.image = [UIImage imageNamed:@"不亲密_03.png"];
            cell.qinmiLable.text = @"不亲密";
        }else if ([cell.qinmiLable.text intValue] == 2){
            cell.peachPentagramImage.image = [UIImage imageNamed:@"亲密_03.png"];
            cell.qinmiLable.text = @"亲密";
        }else if ([cell.qinmiLable.text intValue] == 3){
            cell.peachPentagramImage.image = [UIImage imageNamed:@"一般亲密_03.png"];
            cell.qinmiLable.text = @"一般亲密";
        }else if ([cell.qinmiLable.text intValue] == 4){
            cell.peachPentagramImage.image = [UIImage imageNamed:@"非常亲密_03.png"];
            cell.qinmiLable.text = @"非常亲密";
        }else{
            cell.peachPentagramImage.image = nil;
        }
    

    
    return cell;
   
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 20;
}







- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
