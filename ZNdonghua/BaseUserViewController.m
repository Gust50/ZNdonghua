//
//  BaseUserViewController.m
//  ZNdonghua
//
//  Created by kobe on 16/12/15.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "BaseUserViewController.h"

@interface BaseUserViewController ()

@end

@implementation BaseUserViewController
- (UIView *)loginTitleView{
    if (!_loginTitleView) {
        _loginTitleView = [UIView new];
        _loginTitleView.backgroundColor = [UIColor whiteColor];
    }
    return _loginTitleView;
}
- (UIButton *)backbutton{
    if (!_backbutton) {
        _backbutton = [UIButton new];
        [_backbutton setTitle:@"￣へ￣" forState:UIControlStateNormal];
        [_backbutton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [_backbutton addTarget:self action:@selector(backBtnAC) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backbutton;
}
- (void)backBtnAC{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (UILabel *)centerTitleLabel{
    if (!_centerTitleLabel) {
        _centerTitleLabel = [UILabel new];
        _centerTitleLabel.text = @"用户登录";
        _centerTitleLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _centerTitleLabel;
}
- (UIButton *)rightButton{
    if (!_rightButton) {
        _rightButton = [UIButton new];
        [_rightButton setTitle:@"" forState:UIControlStateNormal];
        _rightButton.titleLabel.textAlignment = NSTextAlignmentLeft;
        [_rightButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    }
    return _rightButton;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initUI];
}
- (void)initUI{
    [self.view addSubview:self.loginTitleView];
    [self.loginTitleView addSubview:self.backbutton];
    [self.loginTitleView addSubview:self.centerTitleLabel];
    [self.loginTitleView addSubview:self.rightButton];
    [self updateViewConstraints];
}
- (void)updateViewConstraints{
    [super updateViewConstraints];
    WS(weakSelf);
    [_loginTitleView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(weakSelf.view);
        make.height.equalTo(@60);
    }];
    [_backbutton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@15);
        make.centerY.equalTo(_loginTitleView).offset(8);
        make.width.equalTo(@60);
        make.height.equalTo(@20);
    }];
    [_centerTitleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.view);
        make.width.equalTo(@80);
        make.centerY.top.equalTo(_backbutton);
    }];
    [_rightButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@-15);
        make.centerY.equalTo(_loginTitleView).offset(8);
        make.width.equalTo(@60);
        make.height.equalTo(@20);
    }];
}

@end
