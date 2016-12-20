//
//  topHeaderView.m
//  ZNdonghua
//
//  Created by kobe on 16/12/20.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "topHeaderView.h"

@interface topHeaderView()
@property(nonatomic,strong)UILabel *title;
@property(nonatomic,strong)UILabel *detail;
@property(nonatomic,strong)UILabel *sum;
@end
@implementation topHeaderView
- (UILabel *)title{
    if (!_title) {
        _title = [UILabel new];
        _title.text = @"漫画巨头“漫威”";
        _title.textAlignment = NSTextAlignmentLeft;
        _title.textColor = [UIColor orangeColor];
    }
    return _title;
}
- (UILabel *)detail{
    if (!_detail) {
        _detail = [UILabel new];
        _detail.text = @"超级英雄梦工厂";
        _detail.font = [UIFont systemFontOfSize:13.0];
        _detail.textAlignment = NSTextAlignmentLeft;
        _detail.textColor = RGB(90, 90, 90);
    }
    return _detail;
}
- (UILabel *)sum{
    if (!_sum) {
        _sum = [UILabel new];
        _sum.text = @"共9部";
        _sum.font = [UIFont systemFontOfSize:13.0];
        _sum.textColor = RGB(90, 90, 90);
    }
    return _sum;
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}
- (void)initUI{
    [self addSubview:self.title];
    [self addSubview:self.detail];
    [self addSubview:self.sum];
    [self updateConstraints];
}
- (void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf);
    [_title mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf);
        make.top.equalTo(weakSelf.mas_top).offset(5);
        make.width.equalTo(@200);
        make.height.equalTo(@20);
    }];
    [_detail mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf);
        make.top.equalTo(_title.mas_bottom).offset(8);
        make.width.equalTo(@180);
        make.height.equalTo(@15);
    }];
    [_sum mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.mas_right).offset(-30);
        make.width.equalTo(@40);
        make.top.equalTo(weakSelf.mas_top).offset(15);
        make.height.equalTo(@15);
    }];
}
@end
