//
//  HttpClient.m
//  MVVMDemo
//
//  Created by lbxia on 2017/3/21.
//  Copyright © 2017年 LBX. All rights reserved.
//

#import "HttpClient.h"

@implementation HttpClient


+ (void)requestListWithBlock:(void(^)(ResponseModel* model))block
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        //造数据
        NSMutableArray *array = [[NSMutableArray alloc]init];
        
        for (int i = 0; i < 5; i++) {
            
            int tmp = [HttpClient random];
            
            NSString *strName = [NSString stringWithFormat:@"item%d",tmp];
            
            NSDictionary* dic = i%2 ? @{@"userName":strName,@"userImage":@"icon_home1",@"userValidate":@"有效"}
            : @{@"userName":strName,@"userImage":@"icon_home3",@"userValidate":@"无效"};
            
            [array addObject:dic];
        }
        
        ResponseModel *model = [[ResponseModel alloc]init];
        model.code = @"0";
        model.message = @"xxx";
        model.arraryItems = array;
        
        block(model);
        
    });
}


+ (void)requestMoreListWithBlock:(void(^)(ResponseModel* model))block
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        //造数据
        NSMutableArray *array = [[NSMutableArray alloc]init];
        
        for (int i = 0; i < 3; i++) {
            
            int tmp = [HttpClient random];
            
            NSString *strName = [NSString stringWithFormat:@"item%d",tmp];
            
            NSDictionary* dic = i%2 ? @{@"userName":strName,@"userImage":@"icon_home1",@"userValidate":@"有效"}
            : @{@"userName":strName,@"userImage":@"icon_home3",@"userValidate":@"无效"};
            
            [array addObject:dic];
        }
        
        ResponseModel *model = [[ResponseModel alloc]init];
        model.code = @"0";
        model.message = @"xxx";
        model.arraryItems = array;
        
        block(model);
        
    });
}

+ (int)random
{
    int x = arc4random() % 100;
    
    return x;
}



@end
