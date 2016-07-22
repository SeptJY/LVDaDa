//
//  JYTabBarController.m
//  LVDaDa
//
//  Created by Sept on 16/7/18.
//  Copyright © 2016年 九月. All rights reserved.
//

#import "JYTabBarController.h"

#import "JYHomeController.h"
#import "JYToolsController.h"
#import "JYHeadLineController.h"
#import "JYMineController.h"
#import "JYNavigationController.h"

@interface JYTabBarController ()

@end

@implementation JYTabBarController

+ (void)initialize
{
    UITabBarItem *appearance = [UITabBarItem appearance];
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = JYMainColor;
    [appearance setTitleTextAttributes:attrs forState:UIControlStateSelected];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupChildViewControllers];
}

/**
 * 初始化所有的子控制器
 */
- (void)setupChildViewControllers
{
    JYHomeController *essence = [[JYHomeController alloc] init];
    [self setupOneChildViewController:essence title:@"首页" image:@"ye-wu-guan-li" selectedImage:@"ye-wu-guan-li(dian-ji)"];
    
    JYToolsController *new = [[JYToolsController alloc] init];
    [self setupOneChildViewController:new title:@"工具" image:@"lv-shi-gong-ju" selectedImage:@"lv-shi-gong-ju(dian-ji)"];
    
    JYHeadLineController *friends = [[JYHeadLineController alloc] init];
    [self setupOneChildViewController:friends title:@"头条" image:@"fa-zhi-tou-tiao" selectedImage:@"fa-zhi-tou-tiao(dian-ji)"];
    
    JYMineController *me = [[JYMineController alloc] init];
    [self setupOneChildViewController:me title:@"我的" image:@"wo" selectedImage:@"wo(dian-ji)"];
}

- (void)setupOneChildViewController:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    vc.tabBarItem.title = title;
    
    UIImage *mImage1 = [UIImage imageNamed:image];
    mImage1 =  [mImage1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.image = mImage1;
    
    UIImage *mImage = [UIImage imageNamed:selectedImage];
    mImage =  [mImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = mImage;
    [self addChildViewController:[[JYNavigationController alloc] initWithRootViewController:vc]];
}

@end
