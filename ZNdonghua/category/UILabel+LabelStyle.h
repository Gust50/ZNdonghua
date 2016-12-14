//
//  UILabel+LabelStyle.h
//  RCC_Project
//
//  Created by liwenbo on 16/3/29.
//  Copyright © 2016年 liwenbo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (LabelStyle)

/**
 *  方便做label宽度自适应
 *
 *  @param text label 内容
 *  @param font label 字体
 *
 *  @return label size
 */
- (CGSize)sizeToFitText:(NSString *)text withFont:(UIFont *)font;

/**
 *  方便一次设置label 所有属性
 *
 *  @param backgroungColor label背景
 *  @param font            label字体
 *  @param text            label内容
 *  @param textColor       label字体颜色
 *  @param textAlignment   label对齐方式
 */
- (void)setLableStyleWithBackgroundColor:(UIColor *)backgroungColor withFont:(UIFont *)font withText:(NSString *)text withTextColor:(UIColor *)textColor withTextAlignment:(NSTextAlignment)textAlignment;

/**
 *   label高度自适应，适用于多行显示
 */
- (void)setLabelAdaptive;

/**
 *  获取Label行高
 *
 *  @param labelWidth label 宽度
 *  @param labelText  label 文字内容
 *  @param labelFont  label 字体
 *
 *  @return label 对应的行高
 */
- (CGFloat)getLabelHeightWithLabelWidth:(CGFloat)labelWidth labelText:(NSString *)labelText labelFont:(UIFont*)labelFont;
@end
