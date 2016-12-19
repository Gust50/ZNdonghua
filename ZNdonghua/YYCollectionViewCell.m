//
//  YYCollectionViewCell.m
//  ZNdonghua
//
//  Created by kobe on 16/12/19.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "YYCollectionViewCell.h"

@interface YYCollectionViewCell()
@property(nonatomic,strong)UIImageView *iconImageView;
@property(nonatomic,strong)UILabel *title;
@property(nonatomic,strong)UILabel *updata;
@end
@implementation YYCollectionViewCell
- (UILabel *)title{
    if (!_title) {
        _title = [UILabel new];
        _title.text = @"2017年1月新番预告";
    }
    return _title;
}
- (UILabel *)updata{
    if (!_updata) {
        _updata = [UILabel new];
        _updata.text = @"更新至第108话";
        _updata.textColor = RGB(150, 151, 158);
        _updata.font = [UIFont systemFontOfSize:14.0];
    }
    return _updata;
}
- (UIImageView *)iconImageView{
    if (!_iconImageView) {
        _iconImageView = [UIImageView new];
    }
    return _iconImageView;
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}
- (void)initUI{
    [self addSubview:self.iconImageView];
    [self addSubview:self.title];
    [self addSubview:self.updata];
    [self updateConstraints];
}
- (void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf);
    [_iconImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(weakSelf);
        make.bottom.equalTo(weakSelf.mas_bottom).offset(-45);
    }];
    [_title mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_iconImageView.mas_bottom).offset(5);
        make.left.right.equalTo(weakSelf);
        make.height.equalTo(@20);
    }];
    [_updata mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf);
        make.height.equalTo(@15);
        make.top.equalTo(_title.mas_bottom).offset(5);
    }];
}

- (void)setModel:(YYanimaes *)model{
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:model.defaultEpImage.url]];
    self.title.text = model.name;
    self.updata.text = [NSString stringWithFormat:@"更新至第 %ld 话",model.onairEpNumber];

}
@end
