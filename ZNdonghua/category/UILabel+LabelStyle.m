//
//  UILabel+LabelStyle.m
//  RCC_Project
//
//  Created by liwenbo on 16/3/29.
//  Copyright © 2016年 liwenbo. All rights reserved.
//

#import "UILabel+LabelStyle.h"

@implementation UILabel (LabelStyle)

- (CGSize)sizeToFitText:(NSString *)text withFont:(UIFont *)font {
    CGSize size = CGSizeMake(MAXFLOAT, MAXFLOAT);
    CGSize textSize = [text boundingRectWithSize:size
                                         options:NSStringDrawingTruncatesLastVisibleLine|
                       NSStringDrawingUsesLineFragmentOrigin|
                       NSStringDrawingUsesFontLeading
                                      attributes:@{NSFontAttributeName:font}
                                         context:nil].size;
    
    return textSize;
}


- (void)setLableStyleWithBackgroundColor:(UIColor *)backgroungColor withFont:(UIFont *)font withText:(NSString *)text withTextColor:(UIColor *)textColor withTextAlignment:(NSTextAlignment)textAlignment{
    self.backgroundColor = backgroungColor;
    self.font = font;
    self.text = text;
    self.textColor = textColor;
    self.textAlignment = textAlignment;
}

- (void)setLabelAdaptive {
    self.numberOfLines = 0;
    self.lineBreakMode = NSLineBreakByWordWrapping;
    
    CGSize size = CGSizeMake(CGRectGetWidth(self.frame), MAXFLOAT);
    CGRect tmpRect = [self.text boundingRectWithSize:size
                                                      options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:self.font,NSFontAttributeName, nil]
                                                      context:nil];
    self.frame = CGRectMake(CGRectGetMinX(self.frame), CGRectGetMinY(self.frame), CGRectGetWidth(self.frame), tmpRect.size.height);
}



- (CGFloat)getLabelHeightWithLabelWidth:(CGFloat)labelWidth labelText:(NSString *)labelText labelFont:(UIFont*)labelFont {
    CGSize size = CGSizeMake(labelWidth, MAXFLOAT);
    CGRect tmpRect = [labelText boundingRectWithSize:size
                                             options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:labelFont,NSFontAttributeName, nil]
                                             context:nil];
    return tmpRect.size.height;
}


@end
