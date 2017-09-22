//
//  TableViewModel.h
//  MVVMDemo
//
//  Created by lbxia on 2017/3/21.
//  Copyright © 2017年 LBX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CellParameterModel.h"


/**
 负责调用网络请求、数据存储、界面数据组织
 */
@interface TableViewModel : NSObject

//界面数据
@property (nonatomic, strong) NSArray<CellParameterModel*> *arrayItems;


- (void)refresh;

- (void)loadMore;

@end
