//
//  LBXTableViewDataSource.h
//  MVVMDemo
//
//  Created by lbxia on 2017/3/22.
//  Copyright © 2017年 LBX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>



/**
 封装TableView的dataSource成block
 */
@interface LBXTableViewDataSource : NSObject<UITableViewDataSource>

//sections,optional
@property (nonatomic, copy) NSInteger (^numberOfSectionsBlock)(UITableView *tableView);

//rows in section,required
@property (nonatomic, copy) NSInteger (^numberOfRowsInSectionBlock)(UITableView *tableView, NSInteger section);

//configure cell ,required
@property (nonatomic, copy) UITableViewCell* (^cellForRowAtIndexPathBlock)(UITableView *tableView, NSIndexPath* indexPath);



@end
