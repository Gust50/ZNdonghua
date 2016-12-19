//
//  ClassficViewController.m
//  ZNdonghua
//
//  Created by kobe on 16/12/19.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "ClassficViewController.h"
#import "classficCell.h"
#import "MainModel.h"
@interface ClassficViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)NSMutableArray *dataSource;
@end
static NSString *const cellID = @"cellID";
@implementation ClassficViewController

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.showsVerticalScrollIndicator = NO;
    }
    return _collectionView;
}
- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    [self initUI];
}
- (void)initUI{
    [self.view addSubview:self.collectionView];
    [self updateViewConstraints];
    [_collectionView registerClass:[classficCell class] forCellWithReuseIdentifier:cellID];
}
- (void)updateViewConstraints{
    [super updateViewConstraints];
    WS(weakSelf);
    [_collectionView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(weakSelf.view);
    }];
}
#pragma mark --- 解析 ---
- (void)loadData{
    NSString *url = ClassifyURL;
    [[NetworkSingleton sharedManager] getDataResult:nil url:url successBlock:^(id responseBody) {
//        NSLog(@"解析分类数据%@",responseBody);
        NSArray *array = [YYanimaes mj_keyValuesArrayWithObjectArray:responseBody];
        for (YYanimaes *animaes in array) {
//            NSLog(@"url:%@",animaes.image);
            [self.dataSource addObject:animaes];
            NSLog(@"数组%@",self.dataSource);
            NSLog(@"name:%@",animaes.name);
        }
        [self.collectionView reloadData];
    } failureBlock:^(NSString *error) {
        
    }];
}
#pragma mark --- UICollectionViewDelegate ---
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataSource.count;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(120, 120);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(10, 5, 0, 5);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 30;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 150;

}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
   classficCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
//    cell.backgroundColor = [UIColor cyanColor];
    cell.model = self.dataSource[indexPath.row];
    
    return cell;
}
@end
