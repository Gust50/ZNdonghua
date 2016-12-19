//
//  MainViewController.m
//  ZNdonghua
//
//  Created by kobe on 16/12/14.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "MainViewController.h"
#import <UIViewController+MMDrawerController.h>
#import <MMDrawerBarButtonItem.h>
#import "LeftViewController.h"
#import "AppDelegate.h"
#import "YaYaViewController.h"
#import "CommentViewController.h"
#import "PartViewController.h"
#import "YaYaClassifyViewController.h"
#import "NewScheduleViewController.h"
@interface MainViewController ()<YaYaViewControllerDelegate,YaYaDelegate>
@property(nonatomic,strong)UISegmentedControl *segment;
@property(nonatomic,strong)UIButton *yaya;
@property(nonatomic,strong)UIButton *comment;
@property(nonatomic,strong)UIButton *part;
@property(nonatomic,strong)UIView *segmentView;
@property(nonatomic,strong)UILabel *yayaLine;
@property(nonatomic,strong)UILabel *commentLine;
@property(nonatomic,strong)UILabel *partLine;
@property(nonatomic,strong)YaYaViewController *yayaVC;
@property(nonatomic,strong)CommentViewController *commentVC;
@property(nonatomic,strong)PartViewController *partVC;
@end

@implementation MainViewController
- (UIButton *)yaya{
    if (!_yaya) {
        _yaya  =[UIButton new];
        _yaya.frame = CGRectMake(100, 10, 40, 20);
        [_yaya setTitle:@"番组" forState:UIControlStateNormal];
        [_yaya setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_yaya addTarget:self action:@selector(yayaAC) forControlEvents:UIControlEventTouchUpInside];
    }
    return _yaya;
}
- (void)yayaAC{
    [_yaya setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [_yayaLine setHidden:NO];
    [_comment setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _commentLine.hidden = YES;
    [_part setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _partLine.hidden = YES;
    
    [self.commentVC.view removeFromSuperview];
    [self.partVC.view removeFromSuperview];
    [self.view addSubview:self.yayaVC.view];
    
}
- (UILabel *)yayaLine{
    if (!_yayaLine) {
        _yayaLine = [UILabel new];
        _yayaLine.frame = CGRectMake(80, 35, 80, 1);
        _yayaLine.backgroundColor = [UIColor orangeColor];
        _yayaLine.hidden = YES;
    }
    return _yayaLine;
}
- (UIButton *)comment{
    if (!_comment) {
        _comment  =[UIButton new];
        _comment.frame = CGRectMake(180, 10, 40, 20);
        [_comment setTitle:@"推荐" forState:UIControlStateNormal];
        [_comment setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_comment addTarget:self action:@selector(commentAC) forControlEvents:UIControlEventTouchUpInside];
        _comment.userInteractionEnabled = YES;
    }
    return _comment;
}
- (void)commentAC{
    [_comment setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [_commentLine setHidden:NO];
    [_yaya setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _yayaLine.hidden = YES;
    [_part setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _partLine.hidden = YES;
    
    [self.yayaVC.view removeFromSuperview];
    [self.partVC.view removeFromSuperview];
    [self.view addSubview:self.commentVC.view];
    
}
- (UILabel *)commentLine{
    if (!_commentLine) {
        _commentLine = [UILabel new];
        _commentLine.frame = CGRectMake(160, 35, 80, 1);
        _commentLine.backgroundColor = [UIColor orangeColor];
        _commentLine.hidden = YES;
    }
    return _commentLine;
}
- (UIButton *)part{
    if (!_part) {
        _part  =[UIButton new];
        _part.frame = CGRectMake(260, 10, 40, 20);
        [_part setTitle:@"分区" forState:UIControlStateNormal];
        [_part setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_part addTarget:self action:@selector(partAC) forControlEvents:UIControlEventTouchUpInside];
        _part.userInteractionEnabled = YES;
    }
    return _part;
}
- (void)partAC{
    [_part setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [_partLine setHidden:NO];
    [_yaya setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _yayaLine.hidden = YES;
    [_comment setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _commentLine.hidden = YES;
    
    [self.commentVC.view removeFromSuperview];
    [self.yayaVC.view removeFromSuperview];
    [self.view addSubview:self.partVC.view];
    
}
- (UILabel *)partLine{
    if (!_partLine) {
        _partLine = [UILabel new];
        _partLine.frame = CGRectMake(240, 35, 80, 1);
        _partLine.backgroundColor = [UIColor orangeColor];
        _partLine.hidden = YES;
    }
    return _partLine;
}
-(UIView *)segmentView{
    if (!_segmentView) {
        _segmentView = [UIView new];
        _segmentView.frame = self.navigationController.navigationBar.frame;
    }
    return _segmentView;
}

- (YaYaViewController *)yayaVC{
    if (!_yayaVC) {
        _yayaVC = [YaYaViewController new];
        _yayaVC.delegate = self;
        _yayaVC.yayaDelegate = self;
    }
    return _yayaVC;
}
- (CommentViewController *)commentVC{
    if (!_commentVC) {
        _commentVC = [CommentViewController new];
    }
    return _commentVC;
}
- (PartViewController *)partVC{
    if (!_partVC) {
        _partVC = [PartViewController new];
    }
    return _partVC;
}
- (void)viewDidLoad {

    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.segmentView addSubview:self.yaya];
    [self.segmentView addSubview:self.yayaLine];
    [self.segmentView addSubview:self.comment];
    [self.segmentView addSubview:self.commentLine];
    [self.segmentView addSubview:self.part];
    [self.segmentView addSubview:self.partLine];
    
    self.navigationItem.titleView = self.segmentView;
    self.yayaLine.hidden = NO;
    [self.yaya setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [self initUI];
}
- (void)initUI{
    [self.view addSubview:self.yayaVC.view];
}

#pragma mark --- YaYaViewControllerDelegate ---
- (void)yayaClassifyAC{
    self.hidesBottomBarWhenPushed = YES;
    YaYaClassifyViewController *yayaClassifyVC = [YaYaClassifyViewController new];
    [self.navigationController pushViewController:yayaClassifyVC animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}
- (void)yayaNewScheduleAC{
    self.hidesBottomBarWhenPushed = YES;
    NewScheduleViewController *newScheduleVC = [NewScheduleViewController new];
    [self.navigationController pushViewController:newScheduleVC animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}

@end
