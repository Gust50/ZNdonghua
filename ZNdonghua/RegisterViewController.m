//
//  RegisterViewController.m
//  ZNdonghua
//
//  Created by kobe on 16/12/15.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()
@property(nonatomic,strong)UIView *loginTitleView;
@property(nonatomic,strong)UIButton *backbutton;
@property(nonatomic,strong)UILabel *centerTitleLabel;
@property(nonatomic,strong)UIButton *rightButton;

@property(nonatomic,strong)UIView *backView;
@property(nonatomic,strong)UIImageView *backImage;

@property(nonatomic,strong)UIImageView *iconView;

@property(nonatomic,strong)UILabel *userName;
@property(nonatomic,strong)UITextField *inputUserName;

@property(nonatomic,strong)UILabel *passWord;
@property(nonatomic,strong)UITextField *inputPassWord;

@property(nonatomic,strong)UILabel *confirmPassWord;
@property(nonatomic,strong)UITextField *inputConfirmPassWord;

@property(nonatomic,strong)UILabel *contact;
@property(nonatomic,strong)UITextField *inputContact;

@property(nonatomic,strong)UILabel *email;
@property(nonatomic,strong)UITextField *inputEmail;

@property(nonatomic,strong)UIButton *verify;
@end

@implementation RegisterViewController
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
        _centerTitleLabel.text = @"用户注册";
        _centerTitleLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _centerTitleLabel;
}
- (UIButton *)rightButton{
    if (!_rightButton) {
        _rightButton = [UIButton new];
        [_rightButton setTitle:@"注册" forState:UIControlStateNormal];
        _rightButton.titleLabel.textAlignment = NSTextAlignmentLeft;
        [_rightButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    }
    return _rightButton;
}


-(UIView *)backView{
    if (!_backView) {
        _backView = [UIView new];
        _backView.backgroundColor = [UIColor whiteColor];
        _backView.alpha = 0.7;
    }
    return _backView;
}
- (UIImageView *)backImage{
    if (!_backImage) {
        _backImage = [UIImageView new];
        _backImage.image = [UIImage imageNamed:@"backImage"];
        _backImage.userInteractionEnabled = YES;
    }
    return _backImage;
}

-(UIImageView *)iconView{
    if (!_iconView) {
        _iconView = [UIImageView new];
        _iconView.layer.cornerRadius = 80;
        _iconView.layer.masksToBounds = YES;
        _iconView.image = [UIImage imageNamed:@"111111"];
    }
    return _iconView;
}


-(UILabel *)userName{
    if (!_userName) {
        _userName = [UILabel new];
        _userName.text  = @"用户名：";
        _userName.textAlignment = NSTextAlignmentLeft;
    }
    return _userName;
}
-(UITextField *)inputUserName{
    if (!_inputUserName) {
        _inputUserName = [UITextField new];
        _inputUserName.layer.borderWidth = 1;
        _inputUserName.layer.borderColor = [UIColor grayColor].CGColor;
        _inputUserName.layer.cornerRadius = 8;
        _inputUserName.placeholder = @"  请输入用户名";
    }
    return _inputUserName;
}



-(UILabel *)passWord{
    if (!_passWord) {
        _passWord = [UILabel new];
        _passWord.text  = @"密码：";
        _passWord.textAlignment = NSTextAlignmentLeft;

    }
    return _passWord;
}
-(UITextField *)inputPassWord{
    if (!_inputPassWord) {
        _inputPassWord = [UITextField new];
        _inputPassWord.layer.borderWidth = 1;
        _inputPassWord.layer.borderColor = [UIColor grayColor].CGColor;
        _inputPassWord.layer.cornerRadius = 8;
        _inputPassWord.placeholder = @"  请输入密码";

    }
    return _inputPassWord;
}


-(UILabel *)confirmPassWord{
    if (!_confirmPassWord) {
        _confirmPassWord = [UILabel new];
        _confirmPassWord.text  = @"确认密码：";
        _confirmPassWord.textAlignment = NSTextAlignmentLeft;
    }
    return _confirmPassWord;
}
-(UITextField *)inputConfirmPassWord{
    if (!_inputConfirmPassWord) {
        _inputConfirmPassWord = [UITextField new];
        _inputConfirmPassWord.layer.borderWidth = 1;
        _inputConfirmPassWord.layer.borderColor = [UIColor grayColor].CGColor;
        _inputConfirmPassWord.layer.cornerRadius = 8;
        _inputConfirmPassWord.placeholder = @"  请再次输入密码";

    }
    return _inputConfirmPassWord;
}


-(UILabel *)contact{
    if (!_contact) {
        _contact = [UILabel new];
        _contact.text  = @"联系方式：";
        _contact.textAlignment = NSTextAlignmentLeft;
    }
    return _contact;
}
-(UITextField *)inputContact{
    if (!_inputContact) {
        _inputContact = [UITextField new];
        _inputContact.layer.borderWidth = 1;
        _inputContact.layer.borderColor = [UIColor grayColor].CGColor;
        _inputContact.layer.cornerRadius = 8;
        _inputContact.placeholder = @"  请输入联系方式";

    }
    return _inputContact;
}

-(UILabel *)email{
    if (!_email) {
        _email  = [UILabel new];
        _email.text  = @"邮箱：";
        _email.textAlignment = NSTextAlignmentLeft;
    }
    return _email;
}
-(UITextField *)inputEmail{
    if (!_inputEmail) {
        _inputEmail = [UITextField new];
        _inputEmail.layer.borderWidth = 1;
        _inputEmail.layer.borderColor = [UIColor grayColor].CGColor;
        _inputEmail.layer.cornerRadius = 8;
        _inputEmail.placeholder = @"  请输入注册邮箱";

    }
    return _inputEmail;
}

- (UIButton *)verify{
    if (!_verify) {
        _verify = [UIButton new];
        [_verify setTitle:@"検証メール" forState:UIControlStateNormal];
        _verify.backgroundColor = RGB(163, 193, 221);
        _verify.layer.cornerRadius = 8;
        [_verify setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return _verify;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    [self initUI];
}
- (void)initUI{
    [self.view addSubview:self.loginTitleView];
    [self.loginTitleView addSubview:self.backbutton];
    [self.loginTitleView addSubview:self.centerTitleLabel];
    [self.loginTitleView addSubview:self.rightButton];
    
    [self.view addSubview:self.backImage];
    [self.backImage addSubview:self.iconView];
    [self.backImage addSubview:self.backView];
    
   
    
    [self.view addSubview:self.userName];
    [self.view addSubview:self.inputUserName];

    [self.view addSubview:self.passWord];
    [self.view addSubview:self.inputPassWord];
    
    [self.view addSubview:self.confirmPassWord];
    [self.view addSubview:self.inputConfirmPassWord];
    
    [self.view addSubview:self.contact];
    [self.view addSubview:self.inputContact];
    
    [self.view addSubview:self.email];
    [self.view addSubview:self.inputEmail];
    
    [self.view addSubview:self.verify];
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

    [_backImage mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(weakSelf.view);
        make.top.equalTo(_loginTitleView.mas_bottom);
    }];
    [_backView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(_backImage);
    }];
    
    [_iconView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_backImage.mas_top).offset(20);
        make.centerX.equalTo(weakSelf.view);
        make.width.height.equalTo(@160);
    }];
    
    [_userName mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@30);
        make.width.equalTo(@80);
        make.height.equalTo(@15);
        make.top.equalTo(_iconView.mas_bottom).offset(30);
    }];
    [_inputUserName mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_userName.mas_right).offset(20);
        make.right.equalTo(_iconView.mas_right).offset(20);
        make.centerY.equalTo(_userName);
        make.height.equalTo(@25);
    }];
    
    
    [_passWord mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@30);
        make.width.equalTo(@80);
        make.height.equalTo(@15);
        make.top.equalTo(_userName.mas_bottom).offset(45);
    }];
    [_inputPassWord mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_inputUserName);
        make.right.equalTo(_inputUserName);
        make.centerY.equalTo(_passWord);
        make.height.equalTo(@25);
    }];

    [_confirmPassWord mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@30);
        make.width.equalTo(@100);
        make.height.equalTo(@15);
        make.top.equalTo(_passWord.mas_bottom).offset(45);
    }];
    [_inputConfirmPassWord mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_inputUserName);
        make.right.equalTo(_inputUserName);
        make.centerY.equalTo(_confirmPassWord);
        make.height.equalTo(@25);
    }];
    
    
    [_contact mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@30);
        make.width.equalTo(@100);
        make.height.equalTo(@15);
        make.top.equalTo(_confirmPassWord.mas_bottom).offset(45);
    }];
    
    [_inputContact mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_inputUserName);
        make.right.equalTo(_inputUserName);
        make.centerY.equalTo(_contact);
        make.height.equalTo(@25);
    }];

    
    [_email mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@30);
        make.width.equalTo(@80);
        make.height.equalTo(@15);
        make.top.equalTo(_contact.mas_bottom).offset(45);
    }];
    [_inputEmail mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_inputUserName);
        make.right.equalTo(_inputUserName);
        make.centerY.equalTo(_email);
        make.height.equalTo(@25);
    }];

    [_verify mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_iconView);
        make.width.equalTo(@120);
//        make.bottom.equalTo(weakSelf.view.mas_bottom).offset(-20);
        make.height.equalTo(@35);
        make.top.equalTo(_email.mas_bottom).offset(40);
    }];
}
@end
