//
//  UIBarButtonItem+JYExtension.m
//  LVDaDa
//
//  Created by Sept on 16/7/19.
//  Copyright © 2016年 丶九月. All rights reserved.
//

#import "UIBarButtonItem+JYExtension.h"

@implementation UIBarButtonItem (JYExtension)

+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    button.size = button.currentBackgroundImage.size;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[self alloc] initWithCustomView:button];
}

@end
