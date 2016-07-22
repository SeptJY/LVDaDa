//
//  JYHomeController.m
//  LVDaDa
//
//  Created by Sept on 16/7/18.
//  Copyright © 2016年 九月. All rights reserved.
//

#import "JYHomeController.h"

#import "JYHomeHeadView.h"
#import "JYBtnData.h"
#import "JYHomeToolCell.h"

#define HeadViewHeight (screenW * 0.47 + screenW * 0.25 + 15)   // 就是headView的高度
static NSString *ID = @"homeTool";
//static NSInteger cellCount = 4;

@interface JYHomeController () <JYHomeHeadViewDelegate, JYHomeToolCellDelegate>
{
    JYHomeHeadView *_headView;
}
@property (assign, nonatomic) CGFloat canOffSet;   // tableView可滑动的范围

@property (strong, nonatomic) NSArray *buttonArray;

@end

@implementation JYHomeController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 掩藏导航栏
    self.navigationController.navigationBarHidden = YES;
    
    // 设置tableView的一些属性
    [self setupTableViewInfo];
}

/**
 * 让当前控制器对应的状态栏是白色
 */
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (NSArray *)buttonArray
{
    if (!_buttonArray) {
        
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"ButtonData" ofType:@"plist"];
        NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
        
        _buttonArray = [JYBtnData mj_objectArrayWithKeyValuesArray:data[@"home"]];
    }
    return _buttonArray;
}

#pragma mark ---> 设置tableView的一些属性
- (void)setupTableViewInfo
{
    // tableView上面多出来20个像素，是因为自动布局的缘故
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self.tableView registerClass:[JYHomeToolCell class] forCellReuseIdentifier:ID];
    // (screenH - HeadViewHeight - 49) * 0.25;
    self.tableView.rowHeight = (667 - HeadViewHeight - 49) * 0.25;
    // 取消分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    // 自定义tableView的头部视图
    _headView = [[JYHomeHeadView alloc] initWithFrame:CGRectMake(0, 0, screenW, HeadViewHeight)];
    _headView.delegate = self;
    self.tableView.tableHeaderView = _headView;
    
    self.tableView.showsVerticalScrollIndicator = NO;
}

#pragma mark ---> JYHomeHeadViewDelegate  预约面谈、电话咨询、在线咨询、委托招标、消息
- (void)headViewBtnOnClick:(UIButton *)btn
{
    switch (btn.tag) {
        case 10:  // 预约面谈
            
            break;
        case 11:  // 电话咨询
            
            break;
        case 12:  // 在线咨询
            
            break;
        case 13:  // 委托招标
            
            break;
        case 14:  // 消息
            
            break;
    }
}

#pragma mark ---> JYHomeCellDelegate 我的订单、我的主页、文案分享等等
- (void)homeCellBtnOnClickWithTag:(NSInteger)tag
{
    switch (tag) {
        case 20:  // 我的订单
            
            break;
        case 21:  // 我的主页
            
            break;
        case 22:  // 文案分享
            
            break;
        case 23:  // 产品发布
            
            break;
        case 24:  // 律师圈
            
            break;
        case 25:  // 活动管理
            
            break;
        case 26:  // 客户关系
            
            break;
        case 27:  // 同行合作
            
            break;
    }
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.buttonArray.count * 0.5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JYHomeToolCell *cell = [JYHomeToolCell cellWithTableView:tableView cellType:JYHomeToolTypeHome];
    cell.delegate = self;
    int index = (int)indexPath.row * 2;
    cell.leftData = self.buttonArray[index];
    cell.rightData = self.buttonArray[index + 1];
    cell.leftTag = 20 + index;
    cell.rightTag = 21 + index;
    
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 49是底部tabBar的默认高度
    self.canOffSet = scrollView.contentSize.height - (screenH - 49);
    
    // 当app下拉未先上拉时禁止下拉，当scrollView的垂直滑动范围等于tableView的高度时禁止滑动
    if (self.canOffSet == 0 || scrollView.contentOffset.y <= 0) {
        self.tableView.contentOffset = CGPointMake(0, 0);
    } else {
        // 当上拉到最后一个cell的时候禁止上拉
        if (scrollView.contentOffset.y >= self.canOffSet) {
            scrollView.contentOffset = CGPointMake(0, self.canOffSet);
        }
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
