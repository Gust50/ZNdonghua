//
//  leftHeaderView.h
//  ZNdonghua
//
//  Created by kobe on 16/12/15.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol leftHeaderViewDelegate <NSObject>
- (void)login;
@end

@interface leftHeaderView : UITableViewHeaderFooterView
@property(nonatomic,weak)id<leftHeaderViewDelegate>delegate;
@end
