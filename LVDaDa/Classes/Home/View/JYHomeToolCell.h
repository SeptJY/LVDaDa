//
//  JYHomeToolCell.h
//  LVDaDa
//
//  Created by Sept on 16/7/20.
//  Copyright © 2016年 丶九月. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JYBtnData, JYToolsData;

/** cell的多重使用
    JYHomeToolTypeHome: 在首页控制器使用的cell
    JYHomeToolTypeTool: 在工具控制器中使用的cell
 */
typedef NS_ENUM(NSUInteger, JYHomeToolType) {
    JYHomeToolTypeHome,
    JYHomeToolTypeTool,
};

@protocol JYHomeToolCellDelegate <NSObject>

@optional
- (void)homeTooleCellBtnOnClick:(UIButton *)btn;

@end

@interface JYHomeToolCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView cellType:(JYHomeToolType)type;

@property (weak, nonatomic) id<JYHomeToolCellDelegate> delegate;

/** 按钮图片和文字的模型数据 */
@property (strong, nonatomic) JYBtnData *leftData;

@property (strong, nonatomic) JYBtnData *rightData;

/** 设置按钮的tag */
@property (assign, nonatomic) NSInteger leftTag;
@property (assign, nonatomic) NSInteger rightTag;

@property (strong, nonatomic) JYToolsData *leftTool;
@property (strong, nonatomic) JYToolsData *rightTool;

@property (strong, nonatomic) UIColor *btnTitleColor;

@end
