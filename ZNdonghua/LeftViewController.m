//
//  LeftViewController.m
//  ZNdonghua
//
//  Created by kobe on 16/12/15.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "LeftViewController.h"
//#import "leftTableViewCell.h"
#import "leftHeaderView.h"
#import "LoginViewController.h"
#import "ClearDishViewController.h"
#import "NightModeViewController.h"
#import "UpdateViewController.h"
#import "AboutBBViewController.h"
#import "JoinUsViewController.h"
#import "NavigationVC.h"
@interface LeftViewController ()<UITableViewDelegate,UITableViewDataSource,leftHeaderViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *array;
@property(nonatomic,strong)LoginViewController *loginVC;
@property(nonatomic,strong)ClearDishViewController *clearDiskVC;
@property(nonatomic,strong)NightModeViewController *nightModeVC;
@property(nonatomic,strong)UpdateViewController *updateVC;
@property(nonatomic,strong)AboutBBViewController *aboutVC;
@property(nonatomic,strong)JoinUsViewController *joinUsVC;
@end
static NSString *const CellID = @"cellID";
static NSString *const HeaderID = @"HeaderID";
@implementation LeftViewController
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [UITableView new];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.tableFooterView = [UITableViewHeaderFooterView new];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}
- (NSMutableArray *)array{
    if (!_array ) {
        _array = [NSMutableArray arrayWithObjects:@"清理缓存",@"夜间模式",@"检查更新",@"关于Biubiu",@"加入我们", nil];
    }
    return _array;
}
- (LoginViewController *)loginVC{
    if (!_loginVC) {
        _loginVC = [LoginViewController new];
    }
    return _loginVC;
}
- (ClearDishViewController *)clearDiskVC{
    if (!_clearDiskVC) {
        _clearDiskVC = [ClearDishViewController new];
    }
    return _clearDiskVC;
}
- (NightModeViewController *)nightModeVC{
    if(!_nightModeVC){
        _nightModeVC = [NightModeViewController new];
    }
    return _nightModeVC;
}
- (UpdateViewController *)updateVC{
    if (!_updateVC) {
        _updateVC = [UpdateViewController new];
    }
    return _updateVC;
}
- (AboutBBViewController *)aboutVC{
    if (!_aboutVC) {
        _aboutVC = [AboutBBViewController new];
    }
    return _aboutVC;
}
- (JoinUsViewController *)joinUsVC{
    if (!_joinUsVC) {
        _joinUsVC = [JoinUsViewController new];
    }
    return _joinUsVC;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initUI];
}
- (void)initUI{
    [self.view addSubview:self.tableView];
    [self updateViewConstraints];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellID];
    [_tableView registerClass:[leftHeaderView class] forHeaderFooterViewReuseIdentifier:HeaderID];
}
- (void)updateViewConstraints{
    [super updateViewConstraints];
    WS(weakSelf);
    [_tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(weakSelf.view);
    }];
    
}
#pragma mark --- UITableViewDelegate ---
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.array.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID forIndexPath:indexPath];
    cell.textLabel.text = self.array[indexPath.row];
    return cell;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    leftHeaderView *leftHeaderView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:HeaderID];
    leftHeaderView.delegate = self;
    return leftHeaderView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 230;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
            [self presentViewController:self.clearDiskVC animated:YES completion:nil];
            break;
           
        case 1:
            [self presentViewController:self.nightModeVC animated:YES completion:nil];
            break;
        case 2:
            [self presentViewController:self.updateVC animated:YES completion:nil];
            break;
        case 3:
            [self presentViewController:self.aboutVC animated:YES completion:nil];
            break;
        case 4:
            [self presentViewController:self.joinUsVC animated:YES completion:nil];
            break;
        default:
            break;
    }
    
}
#pragma mark --- leftHeaderViewDelegate ---
- (void)login{
    NSLog(@"点击");
    
    [self presentViewController:self.loginVC animated:YES completion:nil];
}
@end
