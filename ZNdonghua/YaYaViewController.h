//
//  YaYaViewController.h
//  ZNdonghua
//
//  Created by kobe on 16/12/16.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YaYaViewControllerDelegate <NSObject>
- (void)yayaClassifyAC;
@end

@protocol YaYaDelegate <NSObject>
- (void)yayaNewScheduleAC;
@end

@interface YaYaViewController : UIViewController
@property(nonatomic,weak)id<YaYaViewControllerDelegate>delegate;
@property(nonatomic,weak)id<YaYaDelegate>yayaDelegate;
@end
