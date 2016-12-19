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
#import "YYCollectionViewCell.h"
#import "YYHeaderView.h"
@interface YaYaViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong)DSCarouselView *dscarouseView;
@property(nonatomic,strong)MainModel *mainModel;
@property(nonatomic,strong)YaYaListModel *yayaModel;
@property(nonatomic,strong)NSMutableArray *dataSource;
@property(nonatomic,strong)UIButton *yayaClassify;
@property(nonatomic,strong)UIButton *yayaNewSchedule;
@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)NSMutableArray *urlArray;
@property(nonatomic,strong)NSMutableArray *dataMutableArray;
@property(nonatomic,assign)NSInteger page;
@end
static NSString *const cellID = @"cellID";
static NSString *const headerID = @"headerID";
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
- (NSMutableArray *)dataMutableArray{
    if (!_dataMutableArray) {
        _dataMutableArray = [NSMutableArray array];
    }
    return _dataMutableArray;
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
- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.mj_header = [MJRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadYaYaData)];
        _collectionView.mj_footer = [MJRefreshFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    }
    return _collectionView;
}
- (NSMutableArray *)urlArray{
    if (!_urlArray) {
        _urlArray = [NSMutableArray array];
    }
    return _urlArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.page = 1;
    [self loadData];
    [self loadYaYaData];
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
- (void)loadYaYaData{
    [[NetworkSingleton sharedManager] getDataResult:nil url:FP_TimeListURL successBlock:^(id responseBody) {
        NSArray *array = [YYModel mj_objectArrayWithKeyValuesArray:responseBody];
        for (YYModel *model in array) {
            for (YYanimaes *yyanimaes in model.animes) {
                [self.dataMutableArray addObject:yyanimaes];
            }
            [self.collectionView reloadData];
        }
    } failureBlock:^(NSString *error) {
        
    }];
}

- (void)loadMoreData{
    self.page++;
    NSString *url = [NSString stringWithFormat:@"http://pudding.cc/api/v1/onair_anime?offset=0&limit=%ld&apiKey=yuki_android&deviceKey=00000000-6d05-eb1d-eaf5-22e24b989627&version=2.8.0&brand=htc&model=HTC+M8t&osv=5.0.2&os=Android&cpuArch=armv7l&timestamp=1451111921&channelId=AutoUpdate&auth1=6a5cf8a81d0281937224510507248319",self.page*20];
    [[NetworkSingleton sharedManager] getDataResult:nil url:url successBlock:^(id responseBody) {
        [self.dataMutableArray removeAllObjects];
        NSArray *array = [YYModel mj_objectArrayWithKeyValuesArray:responseBody];
        for (YYModel *model in array) {
            for (YYanimaes *yyanimaes in model.animes) {
                [self.dataMutableArray addObject:yyanimaes];
            }
            [self.collectionView reloadData];
        }
    } failureBlock:^(NSString *error) {
        
    }];
    [self performSelector:@selector(endFooterFreshing) withObject:nil afterDelay:0.5];
}
- (void)endFooterFreshing{
    [self.collectionView.mj_footer endRefreshing];
}
- (void)initUI{
    [self.view addSubview:self.yayaClassify];
    [self.view addSubview:self.yayaNewSchedule];
    [self.view addSubview:self.collectionView];
    [self updateViewConstraints];
    [_collectionView registerClass:[YYCollectionViewCell class] forCellWithReuseIdentifier:cellID];
    [_collectionView registerClass:[YYHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerID];
}
- (void)updateViewConstraints{
    [super updateViewConstraints];
    WS(weakSelf);
    [_dscarouseView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(weakSelf.view);
        make.height.equalTo(@160);
    }];
    [_yayaClassify mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@8);
        make.top.equalTo(@165);
        make.width.equalTo(@(weakSelf.view.width/2 - 10));
        make.height.equalTo(@50);
    }];
    [_yayaNewSchedule mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@-8);
        make.left.equalTo(weakSelf.view.mas_centerX).offset(5);
        make.top.equalTo(_yayaClassify);
        make.height.equalTo(_yayaClassify);
    }];
    
    [_collectionView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(weakSelf.view);
        make.top.equalTo(_yayaNewSchedule.mas_bottom).offset(5);
    }];
}

#pragma mark --- UICollectionViewDelegate ---
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataMutableArray.count;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
        return 20;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 15;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row %2) {
       return CGSizeMake(self.view.width/2 -20, 230);
    }else{
        return CGSizeMake(self.view.width/2 -20, 200);
    }
    
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(5, 10, 0, 10);
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    YYCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell.model = self.dataMutableArray[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(self.view.width, 30);
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        YYHeaderView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerID forIndexPath:indexPath];

        return header;
    }    return nil;
}
@end
