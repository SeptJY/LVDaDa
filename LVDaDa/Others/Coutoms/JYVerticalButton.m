//
//  JYVerticalButton.m
//  LVDaDa
//
//  Created by Sept on 16/7/19.
//  Copyright © 2016年 丶九月. All rights reserved.
//

#import "JYVerticalButton.h"

@interface JYVerticalButton ()

@property (assign, nonatomic) BOOL isHome;

@end

@implementation JYVerticalButton

- (void)setup
{
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithType:(BOOL)isHome
{
    self = [super init];
    if (self) {
        self.isHome = isHome;
        [self setup];
    }
    return self;
}

- (void)awakeFromNib
{
    [self setup];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (self.isHome == NO) {   // 在home控制器中使用
        // 调整图片
        self.imageView.width = 25;
        self.imageView.height = 21.7;
        self.imageView.x = (self.width - self.imageView.width) * 0.5;
        self.imageView.y = 20;
        
        // 调整文字
        self.titleLabel.x = 0;
        self.titleLabel.y = self.imageView.height + 10;
        self.titleLabel.width = self.width;
        self.titleLabel.height = self.height - self.titleLabel.y;
        
    } else {    // 在Tool控制器中使用
        
        // 调整文字
        CGSize titleSize = [NSString sizeWithText:self.titleLabel.text font:setFont(15) maxSize:CGSizeMake(200, 50)];
        
        self.titleLabel.height = titleSize.height;
        self.titleLabel.x = 0;
        self.titleLabel.y = self.height * 0.5 + 25;
        self.titleLabel.width = self.width;
        
        CGFloat space = self.height - self.titleLabel.y - titleSize.height;
        self.imageView.height = self.titleLabel.y - space - 10;
        self.imageView.width = self.imageView.height;
        self.imageView.x = (self.width - self.imageView.width) * 0.5;
        self.imageView.y = space;
    }
}


@end
