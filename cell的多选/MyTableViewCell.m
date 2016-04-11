//
//  MyTableViewCell.m
//  8.6-city-cell
//
//  Created by kz on 15/8/6.
//  Copyright (c) 2015年 KZ. All rights reserved.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.label=[[UILabel alloc]initWithFrame:CGRectMake(20, 10, 200, 30)];
        self.label.textColor=[UIColor brownColor];
        //两种方法添加self.lbl
        [self.contentView addSubview:self.label];
        //        [self addSubview:self.lbl];
    }
    
    return self;
}
-(void)setCellInfo:(NSDictionary *)dic
{
    NSString *name=dic[@"name"];
    if ([dic[@"mark"] isEqualToString:@"0"])
    {
        self.accessoryType=UITableViewCellAccessoryCheckmark;//打钩状态
    }
    else
    {
        self.accessoryType=UITableViewCellAccessoryNone;
    }
    self.label.text=name;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
