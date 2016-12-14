//
//  MainTabBar.m
//  two
//
//  Created by kobe on 16/11/29.
//  Copyright © 2016年 Gust50. All rights reserved.
//
#import "MainTabBar.h"
#import "MainViewController.h"
#import "TimeViewController.h"
#import "DegeneratorViewController.h"
#import "RadioViewController.h"
#import "NavigationVC.h"
@interface MainTabBar ()
@property(nonatomic,strong)MainViewController *mainVC;
@property(nonatomic,strong)TimeViewController *timeVC;
@property(nonatomic,strong)DegeneratorViewController *degeneratorVC;
@property(nonatomic,strong)RadioViewController *radioVC;
@end

@implementation MainTabBar
- (MainViewController *)mainVC{
    if (!_mainVC) {
        _mainVC = [MainViewController new];
    }
    return _mainVC;
}
- (TimeViewController *)timeVC{
    if (!_timeVC) {
        _timeVC = [TimeViewController new];
    }
    return _timeVC;
}

- (DegeneratorViewController *)degeneratorVC{
    if (!_degeneratorVC) {
        _degeneratorVC = [DegeneratorViewController new];
    }
    return _degeneratorVC;
}
- (RadioViewController *)radioVC{
    if (!_radioVC) {
        _radioVC = [RadioViewController new];
    }
    return _radioVC;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [UITabBar appearance].tintColor = [UIColor grayColor];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:52/255.0 green:169/255.0 blue:147/255.0 alpha:1.0]} forState:UIControlStateNormal];
    
    [self controller:self.mainVC title:@"首页" image:@"首页.png" selectImage:@"首页.png"];
    [self controller:self.timeVC title:@"时间轴" image:@"时间线.png" selectImage:@"时间线.png"];
    [self controller:self.degeneratorVC title:@"异次元" image:@"异次元2.png" selectImage:@"异次元2.png"];
    [self controller:self.radioVC title:@"电波" image:@"电波.png" selectImage:@"电波.png"];
}

- (void)controller:(UIViewController *)controller title:(NSString *)title image:(NSString *)image selectImage:(NSString *)selectImage{
    NavigationVC *nav = [[NavigationVC alloc] initWithRootViewController:controller];
    
    controller.tabBarItem  = [[UITabBarItem alloc] initWithTitle:title image:[UIImage imageNamed:image] selectedImage:[[UIImage imageNamed:selectImage] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] ];
    
    [self addChildViewController:nav];
    
}

@end
