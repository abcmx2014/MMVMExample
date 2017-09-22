//
//  TableViewModel.m
//  MVVMDemo
//
//  Created by lbxia on 2017/3/21.
//  Copyright © 2017年 LBX. All rights reserved.
//

#import "TableViewModel.h"
#import "HttpClient.h"


@implementation TableViewModel


- (id)init
{
    if (self = [super init]) {
        
        _arrayItems = @[];
    }
    
    return self;
}

- (void)backData
{
    NSLog(@"backData");
}

- (void)refresh
{
    __weak __typeof(self) weakSelf = self;
    [HttpClient requestListWithBlock:^(ResponseModel *model) {
       
        //请求后的数据处理成View需要的数据
        NSMutableArray *arrayItems = [[NSMutableArray alloc]init];
        [model.arraryItems enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//            [arrayItems addObject:obj[@"item"]];
            
//             @{@"userName":strName,@"userImage":@"icon_home1",@"userValidate":@"有效"}
            CellParameterModel *model = [[CellParameterModel alloc]init];
            model.userName = obj[@"userName"];
            model.userImage = obj[@"userImage"];
            model.userValidate = obj[@"userValidate"];
            
            [arrayItems addObject:model];
        }];
        weakSelf.arrayItems = arrayItems;
    }];
}

- (void)loadMore
{
    __weak __typeof(self) weakSelf = self;
    [HttpClient requestMoreListWithBlock:^(ResponseModel *model) {
       
        //请求后的数据处理成View需要的数据
        NSMutableArray *arrayItems = [[NSMutableArray alloc]init];
        [model.arraryItems enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            CellParameterModel *model = [[CellParameterModel alloc]init];
            model.userName = obj[@"userName"];
            model.userImage = obj[@"userImage"];
            model.userValidate = obj[@"userValidate"];
            
            [arrayItems addObject:model];

        }];
        NSMutableArray *array = [NSMutableArray arrayWithArray:weakSelf.arrayItems];
        [array addObjectsFromArray:arrayItems];
        weakSelf.arrayItems = array;
    }];
}

@end
