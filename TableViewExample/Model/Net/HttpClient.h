//
//  HttpClient.h
//  MVVMDemo
//
//  Created by lbxia on 2017/3/21.
//  Copyright © 2017年 LBX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ResponseModel.h"



@interface HttpClient : NSObject


/**
 请求List数据

 @param block 返回数据
 */
+ (void)requestListWithBlock:(void(^)(ResponseModel* model))block;



/**
 加载更多接口请求

 @param block 返回数据
 */
+ (void)requestMoreListWithBlock:(void(^)(ResponseModel* model))block;

@end
