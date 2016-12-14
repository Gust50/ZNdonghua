//
//  constans.h
//  ZNdonghua
//
//  Created by kobe on 16/12/14.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#ifndef constans_h
#define constans_h
//屏幕宽高
#define kDScreenWidth         ([UIScreen mainScreen].bounds).size.width
#define kDScreenHeight        ([UIScreen mainScreen].bounds).size.height

//几种屏幕的尺寸
#define iPhone4s ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

//屏幕比例
#define KWIDTH_6PLUS_SCALE      [UIScreen mainScreen].bounds.size.width/414.0f
#define KHEIGHT_6PLUS_SCALE     [UIScreen mainScreen].bounds.size.height/736.0f
#define KWIDTH_IPHONE6_SCALE      [UIScreen mainScreen].bounds.size.width/375.0f
#define KHEIGHT_IPHONE6_SCALE     [UIScreen mainScreen].bounds.size.height/667.0f


// iOS 系统版本
#define IOS_VERSION       [[[UIDevice currentDevice] systemVersion] floatValue]

//AppDelegate
#define SHARE_APP ((AppDelegate *)[[UIApplication sharedApplication] delegate])

//RGB 色值
//#define RGBA(r, g, b,a)     [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
//#define RGB(r, g, b)        [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

// RGB 颜色转换（16进制->10进制）
#define RGB_VALUE(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define THEME_COLOR_BLUE    RGB_VALUE(0x007aff)
#define TEXT_COLOR_GRAY     RGB_VALUE(0x888888)
#define TEXT_COLOR_GRAY2    RGB_VALUE(0xbeddff)
#define LOGIN_BACKVIEW_GRAY RGB_VALUE(0xebebeb)
#define TEXT_COLOR_BLACK    RGB_VALUE(0x454545)
#define BUTTON_BACKVIEW     RGBA(247, 247, 247,1.0)
#define LINE_GRAY_COLOR       RGBA(217, 217, 217,1.0)

//重写Debug模式下打印日
#ifdef DEBUG
#define DebugLog(...) NSLog(__VA_ARGS__)
#define DebugMethod() NSLog(@"%s", __func__)
#else
#define DebugLog(...)
#define DebugMethod()
#endif

//行高
#define ROWS_CELL_HEIGHT             44
//导航栏 + 状态栏 高度
#define NAVIGATIONBAR_HEIGHT_64      64
//标签栏高度
#define TABAR_HEIGHT_49              49
//导航栏高度
#define NAVIGATIONBAR_HEIGHT_44      44

//1.弱引用
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
#define KDScreenHeight     [[UIScreen mainScreen] bounds].size.height
#define KDScreenWidth      [[UIScreen mainScreen] bounds].size.width
#define navBarHeight   self.navigationController.navigationBar.frame.size.height
#define ShareApp ((AppDelegate *)[[UIApplication sharedApplication] delegate])
// 2.获得RGB颜色
#define RGBA(r, g, b, a)                    [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r, g, b)                        RGBA(r, g, b, 1.0f)

#define navigationBarColor RGB(67, 199, 176)
#define separaterColor RGB(200, 199, 204)

#endif /* constans_h */
