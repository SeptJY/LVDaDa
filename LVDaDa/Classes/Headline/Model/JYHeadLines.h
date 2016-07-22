//
//  JYHeadLines.h
//  LVDaDa
//
//  Created by Sept on 16/7/22.
//  Copyright © 2016年 丶九月. All rights reserved.
//

// 头条的图片数据

#import <Foundation/Foundation.h>

@interface JYHeadLines : NSObject

/** 阅读人数 */
@property (copy, nonatomic) NSString *browseCount;

/** 评论个数 */
@property (copy, nonatomic) NSString *commentCount;

/** 标题 */
@property (copy, nonatomic) NSString *newsTitle;

/** 分享个数 */
@property (copy, nonatomic) NSString *shareCount;

/** 头条ID */
@property (copy, nonatomic) NSString *newsId;

/** 图片数组 */
@property (strong, nonatomic) NSArray *newsImages;

/** 当前头条创建时间 */
@property (copy, nonatomic) NSString *createDateView;

/** 资源来源途径 */
@property (copy, nonatomic) NSString *newsSource;

@end
