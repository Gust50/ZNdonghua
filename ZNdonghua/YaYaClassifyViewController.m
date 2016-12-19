//
//  YaYaClassifyViewController.m
//  ZNdonghua
//
//  Created by kobe on 16/12/16.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "YaYaClassifyViewController.h"
#import "ClassficViewController.h"
#import "TopicViewController.h"
@interface YaYaClassifyViewController ()
@property(nonatomic,strong)UIView *segmentView;
@property(nonatomic,strong)UIButton *classfic;
@property(nonatomic,strong)UIButton *topic;
@property(nonatomic,strong)UILabel *classficLine;
@property(nonatomic,strong)UILabel *topicLine;
@property(nonatomic,assign)BOOL isClassfic;
@property(nonatomic,assign)BOOL isTopic;
@property(nonatomic,strong)ClassficViewController *classficVC;
@property(nonatomic,strong)TopicViewController *topicVC;
@end

@implementation YaYaClassifyViewController
-(UIView *)segmentView{
    if (!_segmentView) {
        _segmentView = [UIView new];
        _segmentView.frame = self.navigationController.navigationBar.frame;
    }
    return _segmentView;
}
-(UIButton *)classfic{
    if (!_classfic) {
        _classfic = [UIButton new];
        _classfic.frame = CGRectMake(70, 10, 40, 20);
        [_classfic setTitle:@"分类" forState:UIControlStateNormal];
        [_classfic setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [_classfic addTarget:self action:@selector(classficAC) forControlEvents:UIControlEventTouchUpInside];
    }
    return _classfic;
}
- (UILabel *)classficLine{
    if (!_classficLine) {
        _classficLine = [UILabel new];
        _classficLine.frame = CGRectMake(50, 35, 80, 1);
        _classficLine.backgroundColor = [UIColor orangeColor];
        //_classficLine.hidden = YES;
    }
    return _classficLine;
}
- (void)classficAC{
    _classfic.selected = !_classfic.selected;
    [_classfic setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [_classficLine setHidden:NO];
    [_topic setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _topicLine.hidden = YES;
    [self.topicVC.view removeFromSuperview];
    [self.view addSubview:self.classficVC.view];
}
- (UIButton *)topic{
    if (!_topic) {
        _topic = [UIButton new];
        _topic.frame = CGRectMake(160, 10, 40, 20);
        [_topic setTitle:@"专题" forState:UIControlStateNormal];
        [_topic setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_topic addTarget:self action:@selector(topicAC) forControlEvents:UIControlEventTouchUpInside];
    }
    return _topic;
}
- (UILabel *)topicLine{
    if (!_topicLine) {
        _topicLine = [UILabel new];
        _topicLine.frame = CGRectMake(140, 35, 80, 1);
        _topicLine.backgroundColor = [UIColor orangeColor];
        _topicLine.hidden = YES;
    }
    return _topicLine;
}
- (void)topicAC{
     [_topic setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
     [_topicLine setHidden:NO];
    [_classfic setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _classficLine.hidden = YES;
    [self.classficVC.view removeFromSuperview];
    [self.view addSubview:self.topicVC.view];
}
- (ClassficViewController *)classficVC{
    if (!_classficVC) {
        _classficVC = [ClassficViewController new];
    }
    return _classficVC;
}
- (TopicViewController *)topicVC{
    if (!_topicVC) {
        _topicVC = [TopicViewController new];
    }
    return _topicVC;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initUI];
    
}
- (void)initUI{
    [self.segmentView addSubview:self.classfic];
    [self.segmentView addSubview:self.classficLine];
    [self.segmentView addSubview:self.topic];
    [self.segmentView addSubview:self.topicLine];
    self.navigationItem.titleView = self.segmentView;
    [self.view addSubview:self.classficVC.view];
}

@end
