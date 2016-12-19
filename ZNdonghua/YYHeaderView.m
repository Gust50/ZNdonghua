//
//  YYHeaderView.m
//  ZNdonghua
//
//  Created by kobe on 16/12/19.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "YYHeaderView.h"

@interface YYHeaderView()
@property(nonatomic,strong)UIImageView *icon;
@property(nonatomic,strong)UILabel *label;
@end
@implementation YYHeaderView
- (UIImageView *)icon{
    if (!_icon) {
        _icon = [UIImageView new];
        _icon.image = [UIImage imageNamed:@"rocket"];
    }
    return _icon;
}
- (UILabel *)label{
    if (!_label) {
        _label = [UILabel new];
        _label.text = @"全部新番";
    }
    return _label;
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}
- (void)initUI{
    [self addSubview:self.icon];
    [self addSubview:self.label];
    [self updateConstraints];
}
- (void)updateConstraints{
    [super updateConstraints];
    
    [_icon mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(@5);
        make.width.height.equalTo(@20);
    }];
    [_label mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_icon);
        make.width.equalTo(@80);
        make.height.equalTo(@15);
        make.left.equalTo(_icon.mas_right).offset(10);
    }];
}
@end
