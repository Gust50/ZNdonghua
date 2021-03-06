//
//  SearchBaseController.m
//  one
//
//  Created by kobe on 16/11/24.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "SearchBaseController.h"
//#import "SearchVC.h"
@interface SearchBaseController ()
@property(nonatomic,strong)UIButton *rightButton;
@property(nonatomic,strong)UIViewController *leftController;
@end

@implementation SearchBaseController
- (UIButton *)rightButton{
    if (!_rightButton) {
        _rightButton = [UIButton buttonWithType:0];
        _rightButton.frame = CGRectMake(0, 0, 20, 20);
        [_rightButton setImage:[UIImage imageNamed:@"search"] forState:UIControlStateNormal];
        [_rightButton addTarget:self action:@selector(btnAC) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightButton;
}
- (void)btnAC{
//    SearchVC *searchVC = [SearchVC new];
//    self.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:searchVC animated:YES];
//    self.hidesBottomBarWhenPushed = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightButton];
}

#pragma mark --- 使用的方法 ---

- (void)leftImage:(NSString *)image push:(UIViewController *)controller{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(leftBtnAC)];
    self.leftController = controller;
}
- (void)leftBtnAC{
    if (self.leftController == nil) {
     [self performSelector:@selector(alertAC) withObject:self afterDelay:0.1];
    }else{
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:self.leftController animated:YES];
    self.hidesBottomBarWhenPushed = NO;
    }
}
- (void)alertAC{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"关于作者" message:@"作者：gust，QQ：845975151，高仿原创所有，转载请注明出处，不可用于商业用途及其他不合法用途" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"同意" style:0 handler:^(UIAlertAction * _Nonnull action) {
    }];
    [alertController addAction:action];
    [self presentViewController:alertController animated:YES completion:nil];
}
- (void)leftITitle:(NSString *)title push:(UIViewController *)controller{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(leftBtnAC)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    self.leftController = controller;
}
@end
