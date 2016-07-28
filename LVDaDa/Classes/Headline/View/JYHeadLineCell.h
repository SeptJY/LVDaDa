//
//  JYHeadTestCell.h
//  LVDaDa
//
//  Created by Sept on 16/7/23.
//  Copyright © 2016年 丶九月. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JYHeadLines;

@interface JYHeadLineCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property (strong, nonatomic) JYHeadLines *headLines;

@end
