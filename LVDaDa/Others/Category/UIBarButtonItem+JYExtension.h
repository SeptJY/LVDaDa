//
//  UIBarButtonItem+JYExtension.h
//  LVDaDa
//
//  Created by Sept on 16/7/19.
//  Copyright © 2016年 丶九月. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (JYExtension)

+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;

@end
