//
//  YaYaViewController.m
//  ZNdonghua
//
//  Created by kobe on 16/12/16.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "YaYaViewController.h"
#import "DSCarouselView.h"
#import "MainModel.h"

@interface YaYaViewController ()
@property(nonatomic,strong)DSCarouselView *dscarouseView;
@property(nonatomic,strong)MainModel *mainModel;
@property(nonatomic,strong)YaYaListModel *yayaModel;
@property(nonatomic,strong)NSMutableArray *dataSource;
@property(nonatomic,strong)UIButton *yayaClassify;
@property(nonatomic,strong)UIButton *yayaNewSchedule;
@end

@implementation YaYaViewController

- (MainModel *)mainModel{
    if (!_mainModel) {
        _mainModel = [MainModel new];
    }
    return _mainModel;
}
- (YaYaListModel *)yayaModel{
    if (!_yayaModel) {
        _yayaModel = [YaYaListModel new];
    }
    return _yayaModel;
}
- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}
- (UIButton *)yayaClassify{
    if (!_yayaClassify) {
        _yayaClassify = [UIButton new];
        [_yayaClassify setTitle:@"番组分类" forState:UIControlStateNormal];
        _yayaClassify.backgroundColor = [UIColor redColor];
        _yayaClassify.layer.cornerRadius = 8;
        [_yayaClassify addTarget:self action:@selector(yayaClassifyAC) forControlEvents:UIControlEventTouchUpInside];
    }
    return _yayaClassify;
}
- (void)yayaClassifyAC{
    if (self.delegate && [self.delegate respondsToSelector:@selector(yayaClassifyAC)]) {
        [self.delegate yayaClassifyAC];
    }
}
- (UIButton *)yayaNewSchedule{
    if (!_yayaNewSchedule) {
        _yayaNewSchedule = [UIButton new];
        [_yayaNewSchedule setTitle:@"新番时间表" forState:UIControlStateNormal];
        _yayaNewSchedule.backgroundColor = [UIColor redColor];
        _yayaNewSchedule.layer.cornerRadius = 8;
        [_yayaNewSchedule addTarget:self action:@selector(yayaNewScheduleAC) forControlEvents:UIControlEventTouchUpInside];
    }
    return _yayaNewSchedule;
}
- (void)yayaNewScheduleAC{
    if (self.yayaDelegate && [self.yayaDelegate respondsToSelector:@selector(yayaNewScheduleAC)]) {
         [self.yayaDelegate yayaNewScheduleAC];
    }
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self loadData];
    [self initUI];
}
- (void)loadData{
    [[NetworkSingleton sharedManager] getDataResult:nil url:FP_NewProgram_PictureTurns successBlock:^(id responseBody) {
        self.mainModel = [MainModel mj_objectWithKeyValues:responseBody];
        for (_yayaModel in self.mainModel.featured_banner) {
            [self.dataSource addObject:self.yayaModel.imageUrl];
        }
        if (self.dataSource != nil) {
            _dscarouseView = [DSCarouselView carouseViewWithImageURLs:self.dataSource placeholder:nil];
        [self.view addSubview:self.dscarouseView];
            [self updateViewConstraints];
        }
        
    } failureBlock:^(NSString *error) {
        
    }];
}
- (void)initUI{
    [self.view addSubview:self.yayaClassify];
    [self.view addSubview:self.yayaNewSchedule];
    [self updateViewConstraints];
}
- (void)updateViewConstraints{
    [super updateViewConstraints];
    WS(weakSelf);
    [_dscarouseView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(weakSelf.view);
        make.height.equalTo(@200);
    }];
    [_yayaClassify mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@8);
        make.top.equalTo(@205);
        make.width.equalTo(@(weakSelf.view.width/2 - 10));
        make.height.equalTo(@50);
    }];
    [_yayaNewSchedule mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@-8);
        make.left.equalTo(weakSelf.view.mas_centerX).offset(5);
        make.top.equalTo(_yayaClassify);
        make.height.equalTo(_yayaClassify);
    }];
}
@end
