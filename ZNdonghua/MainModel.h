//
//  MainModel.h
//  ZNdonghua
//
//  Created by kobe on 16/12/16.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainModel : NSObject
@property(nonatomic,strong)NSMutableArray *featured_banner;
@end

@interface YaYaListModel : NSObject
@property(nonatomic,strong)NSString *imageUrl;
@property(nonatomic,strong)NSString *url;
@end

@interface YYModel : NSObject
@property(nonatomic,strong)NSMutableArray *animes;
@end

@interface YYanimaes : NSObject
@property(nonatomic,strong)YaYaListModel *defaultEpImage;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,assign)NSInteger onairEpNumber;
@property(nonatomic,strong)YaYaListModel *image;
@end
