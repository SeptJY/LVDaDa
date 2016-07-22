//
//  JYHomeHeadView.h
//  LVDaDa
//
//  Created by Sept on 16/7/18.
//  Copyright © 2016年 九月. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JYHomeHeadViewDelegate <NSObject>

@optional
- (void)headViewBtnOnClick:(UIButton *)btn;

@end

@interface JYHomeHeadView : UIView

@property (weak, nonatomic) id<JYHomeHeadViewDelegate> delegate;

@end
