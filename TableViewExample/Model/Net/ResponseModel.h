//
//  ResponseModel.h
//  MVVMDemo
//
//  Created by lbxia on 2017/3/21.
//  Copyright © 2017年 LBX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ResponseModel : NSObject
@property (nonatomic, strong) NSString *code;
@property (nonatomic, strong) NSString *message;

@property (nonatomic, strong) NSArray<NSDictionary*>* arraryItems;
@end
