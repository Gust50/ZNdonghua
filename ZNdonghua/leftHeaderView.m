//
//  leftHeaderView.m
//  ZNdonghua
//
//  Created by kobe on 16/12/15.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "leftHeaderView.h"

@interface leftHeaderView()
@property(nonatomic,strong)UIImageView *backImageView;
@property(nonatomic,strong)UIButton *iconImageButton;
@property(nonatomic,strong)UILabel *loginLabel;
@end
@implementation leftHeaderView
- (UIImageView *)backImageView{
    if (!_backImageView) {
        _backImageView = [UIImageView new];
        _backImageView.image = [UIImage imageNamed:@"title_imV"];
    }
    return _backImageView;
}
- (UIButton *)iconImageButton{
    if (!_iconImageButton) {
        _iconImageButton = [UIButton new];
        _iconImageButton.layer.cornerRadius = 40;
        _iconImageButton.layer.masksToBounds = YES;
        [_iconImageButton setImage:[UIImage imageNamed:@"picholder"] forState:UIControlStateNormal];
        [_iconImageButton addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    }
    return _iconImageButton;
}
- (void)login{
    if (self.delegate &&[self.delegate respondsToSelector:@selector(login)]) {
        [self.delegate login];
    }
}
- (UILabel *)loginLabel{
    if (!_loginLabel) {
        _loginLabel = [UILabel new];
        _loginLabel.font = [UIFont systemFontOfSize:14.0];
        _loginLabel.textColor = [UIColor whiteColor];
        _loginLabel.textAlignment = NSTextAlignmentLeft;
        _loginLabel.text = @"点击头像登陆";
    }
    return _loginLabel;
}
-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }return self;
}
- (void)initUI{
    [self addSubview:self.backImageView];
    [self addSubview:self.iconImageButton];
    [self addSubview:self.loginLabel];
    [self updateConstraints];
}
- (void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf);
    [_backImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(weakSelf);
    }];
    [_iconImageButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(weakSelf.width/3));
        make.centerY.equalTo(weakSelf);
        make.height.width.equalTo(@80);
    }];
    [_loginLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_iconImageButton);
        make.top.equalTo(_iconImageButton.mas_bottom).offset(10);
        make.width.equalTo(@90);
        make.height.equalTo(@10);
        
    }];
}

@end
