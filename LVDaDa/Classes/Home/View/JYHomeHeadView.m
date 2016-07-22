//
//  JYHomeHeadView.m
//  LVDaDa
//
//  Created by Sept on 16/7/18.
//  Copyright © 2016年 九月. All rights reserved.
//

/** 
    首页tableView的头部视图
    按钮的tag : 10 ~ 13
    171\244
 */


#import "JYHomeHeadView.h"

#import "JYRollingView.h"    // 自定义轮播视图

#define RollingViewHeight screenW * 0.47

@interface JYHomeHeadView ()

@property (strong, nonatomic) JYRollingView *rollingView;

@property (strong, nonatomic) UIButton *faceTalkBtn;   // 预约面谈

@property (strong, nonatomic) UIButton *phoneTalkBtn;   // 电话面谈

@property (strong, nonatomic) UIButton *onlineTalkBtn;  // 在线咨询

@property (strong, nonatomic) UIButton *delegateBtn;  // 委托招标

@property (strong, nonatomic) UIView *bottomView;   // 底部那分割的视图

@property (strong, nonatomic) UIButton *rightTopBtn;   // 左上角按钮

@end

@implementation JYHomeHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        self.backgroundColor = [UIColor yellowColor];
        
    }
    return self;
}

- (JYRollingView *)rollingView
{
    if (!_rollingView) {
        
        _rollingView = [[JYRollingView alloc] initWithimageArray:@[@"http://imgtest.lvdd.cn/banner/2016/04/1459569203519032550.jpg", @"http://imgtest.lvdd.cn/banner/2016/04/1461029676559946386.jpg", @"http://imgtest.lvdd.cn/banner/2016/04/1459568362259185678.jpg"]];
        _rollingView.pagePosition = JYPageControlPositionBottomRight;
        _rollingView.pageNormalColor = [UIColor grayColor];
        
        [self addSubview:_rollingView];
    }
    return _rollingView;
}

#pragma mark ---> 预约面谈、电话咨询、在线咨询、委托招标的初始化
// 预约面谈
- (UIButton *)faceTalkBtn
{
    if (!_faceTalkBtn) {
        
        _faceTalkBtn = [self createBtnWithImage:@"index-yu-yue-mian-tan" title:@"预约面谈"selected:@"index-yu-yue-mian-tan(dian-ji)"];
        _faceTalkBtn.tag = 10;
    }
    return _faceTalkBtn;
}

// 电话咨询
- (UIButton *)phoneTalkBtn
{
    if (!_phoneTalkBtn) {
        
        _phoneTalkBtn = [self createBtnWithImage:@"index-dian-hua-zi-xun" title:@"电话咨询"selected:@"index-dian-hua-zi-xun(dian-ji)"];
        _phoneTalkBtn.tag = 11;
    }
    return _phoneTalkBtn;
}

// 在线咨询
- (UIButton *)onlineTalkBtn
{
    if (!_onlineTalkBtn) {
        
        _onlineTalkBtn = [self createBtnWithImage:@"index-zai-xian-zi-xun" title:@"在线咨询" selected:@"index-zai-xian-zi-xun(dian-ji)"];
        _onlineTalkBtn.tag = 12;
    }
    return _onlineTalkBtn;
}

// 委托招标
- (UIButton *)delegateBtn
{
    if (!_delegateBtn) {
        
        _delegateBtn = [self createBtnWithImage:@"index-wei-tuo-zhao-biao" title:@"委托招标"selected:@"index-wei-tuo-zhao-biao(dian-ji)"];
        _delegateBtn.tag = 13;
    }
    return _delegateBtn;
}

#pragma mark ---> 分割视图
- (UIView *)bottomView
{
    if (!_bottomView) {
        
        _bottomView = [[UIView alloc] init];
        
        _bottomView.backgroundColor = setColor(244, 244, 244);
        
        [self addSubview:_bottomView];
    }
    return _bottomView;
}

#pragma mark ---> 按钮的点击事件
- (void)headViewBtnOnClick:(UIButton *)btn
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(headViewBtnOnClick:)]) {
        [self.delegate headViewBtnOnClick:btn];
    }
}

// 滚动视图中的消息按钮
- (UIButton *)rightTopBtn
{
    if (!_rightTopBtn) {
        
        _rightTopBtn = [[UIButton alloc] init];
        
        [_rightTopBtn setImage:[UIImage imageNamed:@"index-xiao-xi"] forState:UIControlStateNormal];
        [_rightTopBtn setImage:[UIImage imageNamed:@"index-xiao-xi(dian-ji)"] forState:UIControlStateSelected];
        [_rightTopBtn addTarget:self action:@selector(headViewBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
        _rightTopBtn.tag = 14;
        
        [self addSubview:_rightTopBtn];
    }
    return _rightTopBtn;
}

- (void)layoutSubviews
{
    self.rollingView.frame = CGRectMake(0, 0, screenW, RollingViewHeight);
    
    CGFloat btnW = screenW * 0.25;
    CGFloat btnH = btnW + 5;
    
    self.faceTalkBtn.frame = CGRectMake(btnW * 0, RollingViewHeight, btnW, btnH);
    
    self.phoneTalkBtn.frame = CGRectMake(btnW * 1, RollingViewHeight, btnW, btnH);
    
    self.onlineTalkBtn.frame = CGRectMake(btnW * 2, RollingViewHeight, btnW, btnH);
    
    self.delegateBtn.frame = CGRectMake(btnW * 3, RollingViewHeight, btnW, btnH);
    
    CGFloat bottomH = 10;
    self.bottomView.frame = CGRectMake(0, RollingViewHeight + btnH, screenW, bottomH);
    
    self.rightTopBtn.frame = CGRectMake(screenW - 41, 30, 21, 21);
}

#pragma mark ---> 创建一个button按钮
/**
 imageStr: 图片名臣
 title:  按钮标题
 创建一个button按钮
 */
- (UIButton *)createBtnWithImage:(NSString *)imageStr title:(NSString *)title selected:(NSString *)selectedImg
{
    UIButton *btn = [[UIButton alloc] init];
    
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:setColor(57, 57, 57) forState:UIControlStateNormal];
    btn.titleLabel.font = setFont(15);
//    btn.backgroundColor = [UIColor cyanColor];
    [btn setImage:[UIImage imageNamed:selectedImg] forState:UIControlStateSelected];
    [btn setImage:[UIImage imageNamed:imageStr] forState:UIControlStateNormal];
    
    // 设置图片在文字的上面
    btn.imageEdgeInsets = UIEdgeInsetsMake(-btn.titleLabel.intrinsicContentSize.height - 5, 0, 0, -btn.titleLabel.intrinsicContentSize.width);
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, -btn.imageView.frame.size.width, -btn.imageView.frame.size.height * 2.5, 0);
    
    [btn addTarget:self action:@selector(headViewBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:btn];
    
    return btn;
}

@end
