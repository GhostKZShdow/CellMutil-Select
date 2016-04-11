//
//  MyTableViewCell.h
//  8.6-city-cell
//
//  Created by kz on 15/8/6.
//  Copyright (c) 2015年 KZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTableViewCell : UITableViewCell
@property (strong,nonatomic) UILabel *label;
-(void)setCellInfo:(NSDictionary *) dic;
@end
