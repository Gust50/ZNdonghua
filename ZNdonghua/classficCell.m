//
//  classficCell.m
//  ZNdonghua
//
//  Created by kobe on 16/12/19.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "classficCell.h"

@interface classficCell()
@property(nonatomic,strong)UIImageView *icon;
@property(nonatomic,strong)UILabel *label;
@end
@implementation classficCell
- (UIImageView *)icon{
    if (!_icon) {
        _icon = [UIImageView new];
    }
    return _icon;
}
- (UILabel *)label{
    if (!_label) {
        _label = [UILabel new];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.text = @"10月新番";
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
    WS(weakSelf);
    [_icon mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(weakSelf);
        make.bottom.equalTo(weakSelf.mas_bottom).offset(-30);
    }];
    [_label mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf);
        make.top.equalTo(_icon.mas_bottom).offset(5);
        make.height.equalTo(@15);
    }];
}
- (void)setModel:(YYanimaes *)model{
//    [_icon sd_setImageWithURL:[NSURL URLWithString:model.image.url]];
//    _label.text = model.name;
}
@end
