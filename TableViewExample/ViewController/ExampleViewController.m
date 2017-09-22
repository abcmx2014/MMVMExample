//
//  ExampleViewController.m
//  MVVMDemo
//
//  Created by lbxia on 2017/3/21.
//  Copyright © 2017年 LBX. All rights reserved.
//

#import "ExampleViewController.h"
#import "LBXTableViewDelegate.h"
#import "LBXTableViewDataSource.h"
#import "RZDataBinding.h"
#import "TableViewModel.h"
#import "CustomTableViewCell.h"
#import <MJRefresh.h>

@interface ExampleViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) LBXTableViewDelegate *tvDelegate;
@property (nonatomic, strong) LBXTableViewDataSource *tvDataSource;
@property (nonatomic, strong) TableViewModel *viewModel;

@end

@implementation ExampleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self viewModel];
    [self addObserver];
    [self initTableView];
}

- (IBAction)refresh:(id)sender
{
    [_viewModel refresh];
}

- (IBAction)loadMore:(id)sender
{
    [_viewModel loadMore];
}

#pragma mark --TableView


- (TableViewModel*)viewModel
{
    if (!_viewModel) {
        _viewModel = [[TableViewModel alloc]init];
    }
    return _viewModel;
}

- (void)reloadTableData
{
    [_tableView reloadData];
    
    //下拉刷新停止、加载更多停止
    if (_tableView.mj_header.isRefreshing) {
        [_tableView.mj_header endRefreshing];
    }
    
    if (_tableView.mj_footer.isRefreshing) {
        
        [_tableView.mj_footer endRefreshing];
    }
    
    
}

- (void)initTableView
{
    self.tvDelegate = [[LBXTableViewDelegate alloc]init];
    self.tvDataSource = [[LBXTableViewDataSource alloc]init];
    
    _tableView.delegate = _tvDelegate;
    _tableView.dataSource = _tvDataSource;
    
    [self tableViewDelegateAndDataSourceAction];
    
    [_tableView registerNib:[UINib nibWithNibName:@"CustomTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];

    
    
    __weak __typeof(self) weakSelf = self;
    _tableView.mj_header = [MJRefreshHeader headerWithRefreshingBlock:^{
       
        [weakSelf.viewModel refresh];
    }];
    
    [_tableView.mj_header beginRefreshing];
    
    
    
    _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        //Call this Block When enter the refresh status automatically
        
        [weakSelf.viewModel loadMore];
    }];
    
   
}

- (void)tableViewDelegateAndDataSourceAction
{
    __weak __typeof(self) weakSelf = self;
    
    //datasource
    [_tvDataSource setNumberOfSectionsBlock:^NSInteger(UITableView *tableView) {
        return 1;
    }];
    
    [_tvDataSource setNumberOfRowsInSectionBlock:^NSInteger(UITableView *tableView, NSInteger section) {
        
        return weakSelf.viewModel.arrayItems.count;
    }];
    [_tvDataSource setCellForRowAtIndexPathBlock:^UITableViewCell *(UITableView *tv, NSIndexPath *indexPath) {
        
        CustomTableViewCell *cell = [tv dequeueReusableCellWithIdentifier:@"cell"];
        //不要暴露cell的设计
        [cell configure:weakSelf.viewModel.arrayItems[indexPath.row]];
        return cell;
    }];
    
    //delegate
    [_tvDelegate setHeightForRowAtIndexPathBlock:^CGFloat(UITableView * tableView, NSIndexPath *indexPath) {
        
        return 40.0;
    }];
    
    [_tvDelegate setDidSelectRowAtIndexPathBlock:^(UITableView *tv, NSIndexPath *indexPath) {
        NSLog(@"row:%ld",(long)indexPath.row);
    }];

}

- (void)addObserver
{
    //监听ViewModel的数据变化
    [_viewModel rz_addTarget:self action:@selector(reloadTableData) forKeyPathChange:RZDB_KP_OBJ(_viewModel,arrayItems)];
    
//    [_viewModel rz_addTarget:_tableView action:@selector(reloadData) forKeyPathChange:RZDB_KP_OBJ(_viewModel,arrayItems)];
}


@end


