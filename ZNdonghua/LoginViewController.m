//
//  LoginViewController.m
//  ZNdonghua
//
//  Created by kobe on 16/12/15.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "LoginViewController.h"
#import "ForgetPasswordViewController.h"
#import "RegisterViewController.h"
@interface LoginViewController ()
@property(nonatomic,strong)UIView *loginTitleView;
@property(nonatomic,strong)UIButton *backbutton;
@property(nonatomic,strong)UILabel *centerTitleLabel;

@property(nonatomic,strong)UIView *loginInformationView;
@property(nonatomic,strong)UIImageView *loginInformationImageView;
@property(nonatomic,strong)UIView *layerView;

@property(nonatomic,strong)UILabel *userLabel;
@property(nonatomic,strong)UITextField *userTextField;

@property(nonatomic,strong)UILabel *passWordLabel;
@property(nonatomic,strong)UITextField *passWordTextField;

@property(nonatomic,strong)UIButton *loginButton;

@property(nonatomic,strong)UIButton *forgetPassWord;
@property(nonatomic,strong)UIButton *registerUser;
@property(nonatomic,strong)UILabel *lineLabel;

@property(nonatomic,strong)ForgetPasswordViewController *forgetVC;
@property(nonatomic,strong)RegisterViewController *registerVC;
@end

@implementation LoginViewController
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
- (UIView *)loginInformationView{
    if (!_loginInformationView) {
        _loginInformationView = [UIView new];
    }
    return _loginInformationView;
}
- (UIImageView *)loginInformationImageView{
    if (!_loginInformationImageView) {
        _loginInformationImageView = [UIImageView new];
        _loginInformationImageView.image = [UIImage imageNamed:@"backLogin"];
        _loginInformationImageView.alpha = 0.8;
        _loginInformationImageView.userInteractionEnabled = YES;
    }
    return _loginInformationImageView;
}
- (UIView *)layerView{
    if (!_layerView) {
        _layerView = [UIView new];
        _layerView.backgroundColor = [UIColor whiteColor];
        _layerView.alpha = 0.7;
    }
    return _layerView;
}

-(UILabel *)userLabel{
    if (!_userLabel) {
        _userLabel = [UILabel new];
        _userLabel.text = @"用户名：";
        _userLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _userLabel;
}
- (UITextField *)userTextField{
    if (!_userTextField) {
        _userTextField = [UITextField new];
        _userTextField.layer.cornerRadius = 8;
        _userTextField.placeholder = @"  请输入用户名";
        _userTextField.layer.borderWidth = 1;
        _userTextField.layer.borderColor = RGB(173, 192, 216).CGColor;
    }
    return _userTextField;
}
- (UILabel *)passWordLabel{
    if (!_passWordLabel) {
        _passWordLabel = [UILabel new];
        _passWordLabel.text = @"密码：";
        _passWordLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _passWordLabel;
}
- (UITextField *)passWordTextField{
    if (!_passWordTextField) {
        _passWordTextField = [UITextField new];
        _passWordTextField.layer.cornerRadius = 8;
        _passWordTextField.placeholder = @"  请输入密码";
        _passWordTextField.layer.borderColor = RGB(173, 192, 216).CGColor;
        _passWordTextField.layer.borderWidth = 1;
    }
    return _passWordTextField;
}

- (UIButton *)loginButton{
    if (!_loginButton) {
        _loginButton = [UIButton new];
        _loginButton.backgroundColor = RGB(152, 173, 207);
        _loginButton.layer.cornerRadius = 15;
        [_loginButton setTitle:@"点击登陆 带你入宅~" forState:UIControlStateNormal];
        [_loginButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _loginButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_loginButton addTarget:self action:@selector(loginAC) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginButton;
}
- (void)loginAC{
    
}

- (UIButton *)forgetPassWord{
    if (!_forgetPassWord) {
        _forgetPassWord = [UIButton new];
        [_forgetPassWord setTitle:@"忘记密码" forState:UIControlStateNormal];
        [_forgetPassWord setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_forgetPassWord addTarget:self action:@selector(forgetPassWordAC) forControlEvents:UIControlEventTouchUpInside];
    }
    return _forgetPassWord;
}
- (void)forgetPassWordAC{
    NSLog(@"忘记密码");
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"ヒント:" message:@"请输入注册用户信息的邮箱:" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"请输入用户注册邮箱";
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    [alertController addAction:cancelAction];
    
    [alertController addAction:alertAction];
    [self presentViewController:alertController animated:YES completion:nil];
}
- (UILabel *)lineLabel{
    if (!_lineLabel) {
        _lineLabel = [UILabel new];
        _lineLabel.backgroundColor = [UIColor blackColor];
    }
    return _lineLabel;
}
- (UIButton *)registerUser{
    if (!_registerUser) {
        _registerUser = [UIButton new];
        [_registerUser setTitle:@"注册用户" forState:UIControlStateNormal];
        [_registerUser setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_registerUser addTarget:self action:@selector(registerUserAC) forControlEvents:UIControlEventTouchUpInside];
    }
    return _registerUser;
}
- (void)registerUserAC{
    NSLog(@"注册");
    [self presentViewController:self.registerVC animated:YES completion:nil];
}
- (ForgetPasswordViewController *)forgetVC{
    if (!_forgetVC) {
        _forgetVC = [ForgetPasswordViewController new];
    }
    return _forgetVC;
}
- (RegisterViewController *)registerVC{
    if (!_registerVC) {
        _registerVC = [RegisterViewController new];
    }
    return _registerVC;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}
- (void)initUI{
    [self.view addSubview:self.loginTitleView];
    [self.loginTitleView addSubview:self.backbutton];
    [self.loginTitleView addSubview:self.centerTitleLabel];
    [self.view addSubview:self.loginInformationView];
    [self.loginInformationView addSubview:self.loginInformationImageView];
    [self.loginInformationImageView addSubview:self.layerView];
    
    [self.layerView addSubview:self.userLabel];
    [self.layerView addSubview:self.userTextField];
//    
    [self.layerView addSubview:self.passWordLabel];
    [self.layerView addSubview:self.passWordTextField];
//    
    [self.layerView addSubview:self.loginButton];
//    
    [self.layerView addSubview:self.lineLabel];
    [self.layerView addSubview:self.forgetPassWord];
    [self.layerView addSubview:self.registerUser];
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
    [_loginInformationView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(weakSelf.view);
        make.top.equalTo(_loginTitleView.mas_bottom);
    }];
    [_loginInformationImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(_loginInformationView);
    }];
    [_layerView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(_loginInformationView);
    }];
    
    [_userLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@40);
        make.top.equalTo(@45);
        make.width.equalTo(@80);
        make.height.equalTo(@20);
    }];
    [_userTextField mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_userLabel.mas_right).offset(20);
        make.centerY.equalTo(_userLabel);
        make.width.equalTo(@180);
        make.height.equalTo(@35);
    }];
    
    [_passWordLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_userLabel);
        make.top.equalTo(_userLabel.mas_bottom).offset(50);
        make.width.equalTo(@60);
        make.height.equalTo(@20);
    }];
    [_passWordTextField mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.height.equalTo(_userTextField);
        make.centerY.equalTo(_passWordLabel);
    }];

    [_loginButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_layerView);
        make.top.equalTo(_passWordLabel.mas_bottom).offset(30);
        make.width.equalTo(@330);
        make.height.equalTo(@45);
    }];
    
    [_lineLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_layerView);
        make.width.equalTo(@1);
        make.height.equalTo(@20);
        make.top.equalTo(_loginButton.mas_bottom).offset(30);
    }];
    
    [_forgetPassWord mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_lineLabel.mas_left).offset(-40);
        make.width.equalTo(@80);
        make.top.bottom.equalTo(_lineLabel);
    }];
    [_registerUser mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(_lineLabel);
        make.left.equalTo(_lineLabel.mas_right).offset(40);
        make.width.equalTo(@80);
    }];
}
@end
