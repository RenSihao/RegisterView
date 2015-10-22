//
//  ViewController.m
//  注册用户信息
//
//  Created by mac-001 on 15/9/24.
//  Copyright (c) 2015年 mac-001. All rights reserved.
//

#import "ViewController.h"
#import "RegisterInfo.h"
#import "RegisterTableViewCell.h"

#define HEADER_WIDTH 375
#define HEADER_HEIGHT 60
#define TABLE_WIDTH 375
#define TABLE_HEIGHT 567
#define FOOTER_WIDTH 375
#define FOOTER_HEIGHT 40

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UINavigationBar *headerBar;
@property (nonatomic, strong) UITableView     *tableView;
@property (nonatomic, strong) UIToolbar       *footerBar;

@property (nonatomic, strong) NSArray         *registerInfoPlist;
@end

@implementation ViewController

#pragma mark - ViewController类 子控件延迟加载
-(UINavigationBar *)headerBar
{
    if(!_headerBar)
    {
        _headerBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, HEADER_WIDTH, HEADER_HEIGHT)];
        
        [_headerBar setBarTintColor:[UIColor orangeColor]];
    }
    return _headerBar;
}
- (UITableView *)tableView
{
    if(!_tableView)
    {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.headerBar.frame), TABLE_WIDTH, TABLE_HEIGHT) style:UITableViewStyleGrouped];
        [_tableView setBackgroundColor:[UIColor grayColor]];
        
        [_tableView setDelegate:self];
        [_tableView setDataSource:self];
    }
    return _tableView;
}
- (UIToolbar *)footerBar
{
    if(!_footerBar)
    {
        _footerBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.tableView.frame), FOOTER_WIDTH, FOOTER_HEIGHT)];
        [_footerBar setBarTintColor:[UIColor purpleColor]];
    }
    return _footerBar;
}
//数据模型
- (NSArray *)registerInfoPlist
{
    if(!_registerInfoPlist)
    {
        _registerInfoPlist = [RegisterInfo registerInfoPlist];
    }
    return _registerInfoPlist;
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.registerInfoPlist.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RegisterTableViewCell *cell = [RegisterTableViewCell registerTableViewCellInitWithTableView:tableView registerInfo:self.registerInfoPlist[indexPath.row]];
    return cell;
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}
#pragma mark - ViewController类 启动加载

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.headerBar];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.footerBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
