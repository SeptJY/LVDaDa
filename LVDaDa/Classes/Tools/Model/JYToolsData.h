//
//  JYToolsData.h
//  LVDaDa
//
//  Created by Sept on 16/7/20.
//  Copyright © 2016年 丶九月. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JYToolsData : NSObject

/** 图标 */
@property (copy, nonatomic) NSString *iconUrl;

/** 名称 */
@property (copy, nonatomic) NSString *toolName;

/** 链接网址 */
@property (copy, nonatomic) NSString *linkUrl;

/** 名称 */
@property (copy, nonatomic) NSString *remark;

/** 标识符 */
@property (copy, nonatomic) NSString *toolCode;

@end
