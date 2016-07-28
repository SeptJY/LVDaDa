//
//  JYHeadLineController.m
//  LVDaDa
//
//  Created by Sept on 16/7/22.
//  Copyright © 2016年 丶九月. All rights reserved.
//

#import "JYHeadLineController.h"
#import "JYHeadLines.h"
#import "JYHeadLineFrame.h"
#import "JYHeadLineCell.h"
#import "JYHeadLineCell.h"

static NSString *url = @"http://apit.lvdd.cn/news/list?pageSize=15";

@interface JYHeadLineController ()

@property (strong, nonatomic) NSMutableArray *headLines;

@end

@implementation JYHeadLineController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1.设置导航栏的头部视图和左边按钮
    [self setupNavigationInfo];
    
    // 2.设置tableView的参数
    [self setupTableViewInfo];
}

- (void)setupTableViewInfo
{
    //    [self.tableView registerClass:[JYHeadLineCell class] forCellReuseIdentifier:@"headLine"];
    [self.tableView registerNib:[UINib nibWithNibName:@"JYHeadLineCell" bundle:nil] forCellReuseIdentifier:@"headLine"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    // 1.自定义上拉刷新
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(pullRefreshToLoadTheLatestData)];
    
    // 设置文字
    [header setTitle:@"律小二正在服务中" forState:MJRefreshStateRefreshing];
    
    self.tableView.mj_header = header;
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(dropRefreshToLoadMoreSata)];
    self.tableView.mj_footer.hidden = YES;
    
    // 开始刷新
    [self.tableView.mj_header beginRefreshing];
}

- (NSMutableArray *)headLines
{
    if (!_headLines) {
        _headLines = [NSMutableArray array];
    }
    return _headLines;
}

- (void)pullRefreshToLoadTheLatestData
{
    [self.headLines removeAllObjects];
    
    [[AFHTTPSessionManager manager] POST:url parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSArray *headLines = [JYHeadLines mj_objectArrayWithKeyValuesArray:responseObject[@"data"][@"contents"]];
        [self.headLines addObjectsFromArray:headLines];
        
        [self.tableView reloadData];
        
        // 加载完数据后隐藏下拉刷新
        [self.tableView.mj_header endRefreshing];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:@"网络错误"];
    }];
}

- (void)dropRefreshToLoadMoreSata
{
    
}

#pragma mark ---> 设置导航栏的头部视图和左边按钮
- (void)setupNavigationInfo
{
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"lvdd"]];
    
    // 设置导航栏左边的按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:@"index-xiao-xi" highImage:@"index-xiao-xi(dian-ji)" target:self action:@selector(messageOnClick)];
}

- (void)messageOnClick
{
    
}

/**
 *  根据头条模型数组 转成 头条frame模型数据
 *
 *  @param heafLine 头条模型数组
 *
 */
- (NSArray *)headLineFramesWithHeadLines:(NSArray *)headLines
{
    NSMutableArray *frames = [NSMutableArray array];
    for (JYHeadLines *headLine in headLines) {
        JYHeadLineFrame *frame = [[JYHeadLineFrame alloc] init];
        // 传递微博模型数据，计算所有子控件的frame
        frame.headLines = headLine;
        [frames addObject:frame];
    }
    return frames;
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.headLines.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JYHeadLineCell *cell = [JYHeadLineCell cellWithTableView:tableView];
    
    cell.headLines = self.headLines[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JYHeadLines *frame = self.headLines[indexPath.row];
//    NSLog(@"%f", frame.cellHeight);
    return frame.cellHeight;
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
