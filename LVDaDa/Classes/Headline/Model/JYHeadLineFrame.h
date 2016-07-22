//
//  JYHeadLineFrame.h
//  LVDaDa
//
//  Created by Sept on 16/7/22.
//  Copyright © 2016年 丶九月. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JYHeadLines;

@interface JYHeadLineFrame : NSObject

@property (strong, nonatomic) JYHeadLines *headLines;

/** 标题 */
@property (nonatomic, assign) CGRect titleFrame;

/** 子控件的frame数据 */
@property (nonatomic, assign) CGRect toolbarFrame;

/** cell的高度 */
@property (nonatomic, assign) CGFloat cellHeight;

@property (strong, nonatomic) NSMutableArray *iconFrames;

@end
