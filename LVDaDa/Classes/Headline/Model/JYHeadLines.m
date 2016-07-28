//
//  JYHeadLines.m
//  LVDaDa
//
//  Created by Sept on 16/7/22.
//  Copyright © 2016年 丶九月. All rights reserved.
//

#import "JYHeadLines.h"

@interface JYHeadLines ()
{
    CGFloat _cellHeight;
}

@end

@implementation JYHeadLines

// 这个方法对比上面的2个方法更加没有侵入性和污染，因为不需要导入Status和Ad的头文件
+ (NSDictionary *)objectClassInArray{
    return @{
             @"newsImages" : @"JYHeadLinesImage",
             };
}

- (CGFloat)cellHeight
{
    if (!_cellHeight) {
        // 文字的最大尺寸
        CGSize maxSize = CGSizeMake([UIScreen mainScreen].bounds.size.width - 2 * 15, MAXFLOAT);
        // 计算文字的高度
        CGFloat textH = [self.newsTitle boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:17]} context:nil].size.height;
        
        // cell的高度
        CGFloat H = (screenW - 40) / 3 * 3 / 4;
        CGFloat imgH = (self.newsImages.count > 1) ? H : 140;
        _cellHeight = 20 + textH + imgH + 35;
    }
    return _cellHeight;
}

@end
