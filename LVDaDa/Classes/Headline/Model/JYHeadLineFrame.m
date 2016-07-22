//
//  JYHeadLineFrame.m
//  LVDaDa
//
//  Created by Sept on 16/7/22.
//  Copyright © 2016年 丶九月. All rights reserved.
//

#import "JYHeadLineFrame.h"

#import "JYHeadLines.h"

const static NSInteger magrinY = 10;
const static NSInteger magrinX = 15;
const static NSInteger space = 5;

@implementation JYHeadLineFrame

- (NSMutableArray *)iconFrames
{
    if (!_iconFrames) {
        _iconFrames = [NSMutableArray array];
    }
    return _iconFrames;
}

- (void)setHeadLines:(JYHeadLines *)headLines
{
    _headLines = headLines;
    
    // 1.设置标题的frame
//    CGSize titleSize = [NSString sizeWithText:headLines.newsTitle font:setFont(17) maxSize:CGSizeMake(500, MAXFLOAT)];
    
    CGFloat titleX = magrinX;
    CGFloat titleY = magrinY;
    CGFloat titleW = screenW - 2 * titleX;
    
    CGSize titleSize = [NSString sizeWithText:headLines.newsTitle font:setFont(17) maxSize:CGSizeMake(titleW, MAXFLOAT)];
    self.titleFrame = CGRectMake(titleX, titleY, titleW, titleSize.height);
    
    // 2.设置图片的frame
    CGFloat iconW = (headLines.newsImages.count > 1) ? (titleW - 2 * space) / 3 : titleW;
    CGFloat iconY = CGRectGetMaxY(self.titleFrame) + magrinY;
    CGFloat iconH = 80;
    
    [self.iconFrames removeAllObjects];
    switch (headLines.newsImages.count) {
        case 1:
        {
            CGFloat iconX = magrinX;
            CGRect imgFrame = CGRectMake(iconX, iconY, iconW, iconH);
            
            //由于CGRect是结构体，不是对象所以不能存入数组，要先转换成NSValue对象才能存入数组
            NSValue *value = [NSValue valueWithCGRect:imgFrame];
            
            [self.iconFrames addObject:value];
        }
            break;
        case 2:
        {
            // one
            CGFloat iconX1  = magrinX;
            CGRect imgFrame1 = CGRectMake(iconX1, iconY, iconW, iconH);
            
            NSValue *value1 = [NSValue valueWithCGRect:imgFrame1];
            
            // two
            CGFloat iconX2  = CGRectGetMaxX(imgFrame1) + space;
            CGRect imgFrame2 = CGRectMake(iconX2, iconY, iconW, iconH);
            
            NSValue *value2 = [NSValue valueWithCGRect:imgFrame2];
            
            [self.iconFrames addObjectsFromArray:@[value1, value2]];
        }
            
            break;
        case 3:
        {
            // one
            CGFloat iconX1  = magrinX;
            CGRect imgFrame1 = CGRectMake(iconX1, iconY, iconW, iconH);
            
            NSValue *value1 = [NSValue valueWithCGRect:imgFrame1];
            
            // two
            CGFloat iconX2  = CGRectGetMaxX(imgFrame1) + space;
            CGRect imgFrame2 = CGRectMake(iconX2, iconY, iconW, iconH);
            
            NSValue *value2 = [NSValue valueWithCGRect:imgFrame2];
            
            // three
            CGFloat iconX3  = CGRectGetMaxX(imgFrame2) + space;
            CGRect imgFrame3 = CGRectMake(iconX3, iconY, iconW, iconH);
            
            NSValue *value3 = [NSValue valueWithCGRect:imgFrame3];
            
            [self.iconFrames addObjectsFromArray:@[value1, value2, value3]];
        }
            break;
            
        default:
            break;
    };
        
    CGFloat toolbarX = 0;
    CGFloat toolbarY = iconH + magrinY;
    CGFloat toolbarW = screenW;
    CGFloat toolbarH = 35;
    self.toolbarFrame = CGRectMake(toolbarX, toolbarY, toolbarW, toolbarH);
    
    // 3.计算cell的高度
    self.cellHeight = CGRectGetMaxY(self.toolbarFrame);
}

@end
