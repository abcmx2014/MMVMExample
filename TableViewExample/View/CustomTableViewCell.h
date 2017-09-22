//
//  CustomTableViewCell.h
//  MVVMDemo
//
//  Created by lbxia on 2017/3/22.
//  Copyright © 2017年 LBX. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CellParameterModel.h"


@interface CustomTableViewCell : UITableViewCell



- (void)configure:(CellParameterModel*)model;

@end
