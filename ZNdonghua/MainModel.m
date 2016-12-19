//
//  MainModel.m
//  ZNdonghua
//
//  Created by kobe on 16/12/16.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "MainModel.h"

@implementation MainModel
+(NSDictionary *)mj_objectClassInArray{
    return @{@"featured_banner":@"YaYaListModel"};
}
@end

@implementation YaYaListModel

@end

@implementation YYModel
+(NSDictionary *)mj_objectClassInArray{
    return @{@"animes":@"YYanimaes"};
}
@end

@implementation YYanimaes

@end
