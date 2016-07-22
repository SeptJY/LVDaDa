//
//  JYToolsController.m
//  LVDaDa
//
//  Created by Sept on 16/7/19.
//  Copyright © 2016年 丶九月. All rights reserved.
//

#import "JYToolsController.h"
#import "JYToolsData.h"
#import "JYHomeToolCell.h"

static NSString *ID = @"home";
//static NSInteger cellCount = 3;
static NSString *url = @"http://apit.lvdd.cn/tool/getAllTool?imei=25A9BBD9-65A3-4A54-818C-5BE5008E77BD/versionCode=8";

@interface JYToolsController () <JYHomeToolCellDelegate>

@property (strong, nonatomic) NSArray *buttonArray;

@end

@implementation JYToolsController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1.设置导航栏的头部视图和左边按钮
    [self setupTableViewInfo];
    
    // 2.初始化tableView的信息
    [self setupTableViewInfo];
    
    // 3.请求数据
    [self requestHttpDataaa];
}

#pragma mark ---> 设置导航栏的头部视图和左边按钮
- (void)setupNavigationInfo
{
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"lvdd"]];
    
    // 设置导航栏左边的按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:@"index-xiao-xi" highImage:@"index-xiao-xi(dian-ji)" target:self action:@selector(messageOnClick)];
}

#pragma mark ---> 初始化tableView的信息
- (void)setupTableViewInfo
{
    // tableView上面多出来20个像素，是因为自动布局的缘故
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.tableView.bounces = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[JYHomeToolCell class] forCellReuseIdentifier:ID];
    self.tableView.rowHeight = (self.tableView.height - 44 - 49) / 3;
}

- (void)messageOnClick
{
    
}

- (void)requestHttpDataaa
{
    [[AFHTTPSessionManager manager] POST:url parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        self.buttonArray = [JYToolsData mj_objectArrayWithKeyValuesArray:responseObject[@"data"]];
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:@"网络错误"];
    }];
}

#pragma mark ---> JYHomeToolCellDelegate 律师计算器、企业信用、法律查询等等
- (void)homeTooleCellBtnOnClick:(UIButton *)btn
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.buttonArray.count * 0.5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JYHomeToolCell *cell = [JYHomeToolCell cellWithTableView:tableView cellType:JYHomeToolTypeTool];
    cell.delegate = self;
    int index = (int)indexPath.row * 2;
    cell.leftTool = self.buttonArray[index];
    cell.rightTool = self.buttonArray[index + 1];
    cell.leftTag = 20 + index;
    cell.rightTag = 21 + index;
    cell.btnTitleColor = [UIColor blackColor];
    
    return cell;
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
