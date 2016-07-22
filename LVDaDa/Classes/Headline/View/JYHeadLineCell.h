//
//  JYHeadLineCell.h
//  LVDaDa
//
//  Created by Sept on 16/7/22.
//  Copyright © 2016年 丶九月. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JYHeadLineFrame;

@interface JYHeadLineCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property (strong, nonatomic) JYHeadLineFrame *headFrame;

@end
