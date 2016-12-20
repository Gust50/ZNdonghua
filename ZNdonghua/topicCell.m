//
//  topicCell.m
//  ZNdonghua
//
//  Created by kobe on 16/12/20.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "topicCell.h"

@interface topicCell()
@property(nonatomic,strong)UIImageView *icon;
@end
@implementation topicCell
- (UIImageView *)icon{
    if (!_icon) {
        _icon = [UIImageView new];
    }
    return _icon;
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}
- (void)initUI{
    [self addSubview:self.icon];
    [self updateConstraints];
}
- (void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf);
    [_icon mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(weakSelf);
        make.bottom.equalTo(weakSelf.mas_bottom).offset(0);
    }];
   
}
- (void)setModel:(YYanimaes *)model{
    [_icon sd_setImageWithURL:[NSURL URLWithString:model.image.url]];
}

@end
