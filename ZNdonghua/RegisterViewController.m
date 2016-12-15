//
//  RegisterViewController.m
//  ZNdonghua
//
//  Created by kobe on 16/12/15.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.centerTitleLabel.text = @"用户注册";
    [self.rightButton setTitle:@"注册" forState:UIControlStateNormal];
}

@end
