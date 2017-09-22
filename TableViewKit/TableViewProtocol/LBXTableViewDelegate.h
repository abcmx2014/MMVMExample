//
//  LBXTableViewDelegate.h
//  MVVMDemo
//
//  Created by lbxia on 2017/3/22.
//  Copyright © 2017年 LBX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LBXTableViewDelegate : NSObject<UITableViewDelegate>
//row height
@property (nonatomic, copy) CGFloat (^heightForRowAtIndexPathBlock)(UITableView *tableView, NSIndexPath*indexPath);

//user select row
@property (nonatomic, copy) void (^didSelectRowAtIndexPathBlock)(UITableView *tableView, NSIndexPath*indexPath);

//user deselect row
@property (nonatomic, copy) void (^didDeselectRowAtIndexPathBlock)(UITableView *tableView, NSIndexPath*indexPath);

@end
