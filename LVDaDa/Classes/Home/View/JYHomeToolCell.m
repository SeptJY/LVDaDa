//
//  JYHomeToolCell.m
//  LVDaDa
//
//  Created by Sept on 16/7/20.
//  Copyright © 2016年 丶九月. All rights reserved.
//

#import "JYHomeToolCell.h"
#import "JYVerticalButton.h"
#import "JYBtnData.h"
#import "JYToolsData.h"
#import "UIButton+WebCache.h"

@interface JYHomeToolCell ()

@property (strong, nonatomic) JYVerticalButton *leftBtn;

@property (strong, nonatomic) JYVerticalButton *rightBtn;

@property (assign, nonatomic) JYHomeToolType type;

// 自定义底部的分割线
@property (strong, nonatomic) UIView *splittersLine;

// 中间分割线
@property (strong, nonatomic) UIView *spaceLine;

@end

@implementation JYHomeToolCell

+ (instancetype)cellWithTableView:(UITableView *)tableView cellType:(JYHomeToolType)type
{
    static NSString *ID = @"homeTool";
    
    JYHomeToolCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[JYHomeToolCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID cellType:type];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier cellType:(JYHomeToolType)type
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.type = type;
    }
    return self;
}

//- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
//{
//    
//}

// 自定义底部分割线
- (UIView *)splittersLine
{
    if (!_splittersLine) {
        
        _splittersLine = [[UIView alloc] init];
        _splittersLine.backgroundColor = setColor(244, 244, 244);
        _splittersLine.hidden = self.type;
        
        [self.contentView addSubview:_splittersLine];
    }
    return _splittersLine;
}

// 中间分割线
- (UIView *)spaceLine
{
    if (!_spaceLine) {
        
        _spaceLine = [[UIView alloc] init];
        _spaceLine.backgroundColor = setColor(244, 244, 244);
        _spaceLine.hidden = self.type;
        
        [self.contentView addSubview:_spaceLine];
    }
    return _spaceLine;
}

// 左边按钮
- (JYVerticalButton *)leftBtn
{
    if (!_leftBtn) {
        
        _leftBtn = [self quickCreateButton];
    }
    return _leftBtn;
}

// 右边按钮
- (JYVerticalButton *)rightBtn
{
    if (!_rightBtn) {
        
        _rightBtn = [self quickCreateButton];
    }
    return _rightBtn;
}

#pragma mark ---> 设置按钮的图片和文字
- (void)setLeftData:(JYBtnData *)leftData
{
    _leftData = leftData;
    [self setupTitleAndImageWith:self.leftBtn data:leftData];
}

- (void)setRightData:(JYBtnData *)rightData
{
    _rightData = rightData;
    [self setupTitleAndImageWith:self.rightBtn data:rightData];
}

- (void)setupTitleAndImageWith:(UIButton *)btn data:(JYBtnData *)data
{
    [btn setTitle:data.title forState:UIControlStateNormal];
    
    [btn setImage:[UIImage imageNamed:data.image] forState:UIControlStateNormal];
    
    [btn setImage:[UIImage imageNamed:data.seleImage] forState:UIControlStateHighlighted];
}


#pragma mark ---> 快速创建一个按钮
- (JYVerticalButton *)quickCreateButton
{
    JYVerticalButton *btn = [[JYVerticalButton alloc] initWithType:self.type];
    
    [btn setTitleColor:setColor(144, 144, 144) forState:UIControlStateNormal];
    btn.titleLabel.font = setFont(15);
    [btn addTarget:self action:@selector(homeTooleCellBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.contentView addSubview:btn];
    
    return btn;
}

#pragma mark ---> 按钮的点击事件
- (void)homeTooleCellBtnOnClick:(UIButton *)btn
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(homeTooleCellBtnOnClick:)]) {
        [self.delegate homeTooleCellBtnOnClick:btn];
    }
}

#pragma mark ---> 设置按钮的tag标识
- (void)setLeftTag:(NSInteger)leftTag
{
    _leftTag = leftTag;
    self.leftBtn.tag = leftTag;
}

- (void)setRightTag:(NSInteger)rightTag
{
    _rightTag = rightTag;
    self.rightBtn.tag = rightTag;
}

#pragma mark ---> 设置工具控制器的数据
- (void)setLeftTool:(JYToolsData *)leftTool
{
    _leftTool = leftTool;
    [self setupTitleAndImageWith:self.leftBtn tool:leftTool];
}

- (void)setRightTool:(JYToolsData *)rightTool
{
    _rightTool = rightTool;
    [self setupTitleAndImageWith:self.rightBtn tool:rightTool];
}

#pragma mark ---> 设置按钮标题颜色
- (void)setBtnTitleColor:(UIColor *)btnTitleColor
{
    _btnTitleColor = btnTitleColor;
    
    [self.leftBtn setTitleColor:btnTitleColor forState:UIControlStateNormal];
    [self.rightBtn setTitleColor:btnTitleColor forState:UIControlStateNormal];
}

- (void)setupTitleAndImageWith:(UIButton *)btn tool:(JYToolsData *)tool
{
    [btn setTitle:tool.toolName forState:UIControlStateNormal];
    
    [btn setImage:[UIImage imageNamed:tool.iconUrl] forState:UIControlStateNormal];
    
    //    [btn setImage:[UIImage imageNamed:data.seleImage] forState:UIControlStateHighlighted];
    [btn sd_setImageWithURL:[NSURL URLWithString:tool.iconUrl] forState:UIControlStateNormal];
}

#pragma mark ---> 设置控制的frame
- (void)layoutSubviews
{
    CGFloat splittersH = 2;
    CGFloat splittersY = self.height - splittersH;
    self.splittersLine.frame = CGRectMake(0, splittersY, self.width, splittersH);
    
    CGFloat spaceW = 1;
    CGFloat spaceX = (self.width - spaceW) * 0.5;
    CGFloat spaceY = 20;
    CGFloat spaceH = self.height - 2 * spaceY;
    self.spaceLine.frame = CGRectMake(spaceX, spaceY, spaceW, spaceH);
    
    CGFloat btnH = self.height - splittersH;
    self.leftBtn.frame = CGRectMake(0, 0, spaceX, btnH);
    
    self.rightBtn.frame = CGRectMake(spaceX + spaceW, 0, spaceX, btnH);;
}

@end
