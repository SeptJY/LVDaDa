//
//  JYHeadLines.m
//  LVDaDa
//
//  Created by Sept on 16/7/22.
//  Copyright © 2016年 丶九月. All rights reserved.
//

#import "JYHeadLines.h"

@implementation JYHeadLines

// 这个方法对比上面的2个方法更加没有侵入性和污染，因为不需要导入Status和Ad的头文件
+ (NSDictionary *)objectClassInArray{
    return @{
             @"newsImages" : @"JYHeadLinesImage",
             };
}

@end
