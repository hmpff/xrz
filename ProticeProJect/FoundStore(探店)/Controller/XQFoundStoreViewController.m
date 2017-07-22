//
//  ProticeProJect.pch
//  ProticeProJect
//
//  Created by XQ_明鹏 on 15/8/5.
//  Copyright © 2015年 明鹏. All rights reserved.
//

#import "XQFoundStoreViewController.h"
#import "XQTitleBtn.h"
#import "XQFoundTitleView.h"
#import "UIImage+Image.h"

#import "XQBeautifulDayItem.h"
#import "XQThemesCell.h"
#import "XQThemesItem.h"
#import "XQEventCell.h"

#import "XQBeautifulDayDetail.h"

#import "XQChooseCityViewController.h"
#import "XQNearViewController.h"

#define NavH 64
#define tabBarH 49

@interface XQFoundStoreViewController ()<XQFoundTitleViewDelegate,UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, weak)UIScrollView *bottomScollView;

@property (nonatomic, weak)UITableView *letfTableV;
@property (nonatomic, weak)UITableView *rightTableV;

@property (nonatomic, strong)NSArray *leftData;

@property (nonatomic, strong)NSArray *themeData;

@end



@implementation XQFoundStoreViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //设置背景
    
    //[self. navigationController.navigationBar  setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forBarMetrics:UIBarMetricsDefault];
    
}
/**
 *  加载美天数据
 *
 *  @return 所有的美天数据
 */
- (NSArray *)leftData {
    
    if (_leftData == nil) {
        _leftData =  [XQBeautifulDayItem getMessage];
    }
    return _leftData;
}

/**
 *  加载美辑
 *
 *  @return 所有的美天美辑
 */
- (NSArray *)themeData {
    
    if (_themeData == nil) {
        _themeData =  [XQThemesItem getThemesData];
    }
    return _themeData;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //设置导航条
    [self setNav];
    //设置ScrollView
    [self setScrollView];

    //在ScrollView中添加TableView
    [self setTableView];
    
    
    
}

/**
 *  设置导航条
 */
- (void)setNav {
    

    //设置左侧内容
    XQTitleBtn *btn = [XQTitleBtn buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"罗马" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"home_down"] forState:UIControlStateNormal];
    //监听按钮点击
    [btn addTarget:self action:@selector(cityClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    //设置右侧内容
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"附近" style:0 target:self action:@selector(nearClick)];
    
    //设置中间标题视图
    XQFoundTitleView *titleV = [[XQFoundTitleView alloc] init];
    titleV.titleArray = @[@"美天",@"美辑"];
    titleV.frame = CGRectMake(0, 0, 120, 44);
    titleV.delegate = self;
    self.navigationItem.titleView = titleV;
    
    
    self.automaticallyAdjustsScrollViewInsets = NO;
}

/**
 *  设置ScrollView
 */
- (void)setScrollView {
    
    UIScrollView *bottomScollView = [[UIScrollView alloc] init];
    //设置scrollView属性.
   
    bottomScollView.frame = CGRectMake(0, NavH, screenW, screenH  - tabBarH - NavH);
    bottomScollView.backgroundColor = XQColor(255, 255, 255, 1);
    bottomScollView.contentSize = CGSizeMake(screenW * 2.0, 0);
    bottomScollView.showsHorizontalScrollIndicator = NO;
    bottomScollView.showsVerticalScrollIndicator = NO;
    bottomScollView.pagingEnabled = YES;
    bottomScollView.delegate = self;
    bottomScollView.bounces = NO;
    [self.view addSubview:bottomScollView];
    self.bottomScollView = bottomScollView;
}

/**
 *  在ScrollView中添加TableView
 */
- (void)setTableView {
    //美天
    UITableView *letfTableV = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenW, self.bottomScollView.height) style:UITableViewStyleGrouped];
    letfTableV.dataSource = self;
    letfTableV.delegate = self;
    letfTableV.backgroundColor = XQColor(255, 255, 255, 1);
    letfTableV.separatorStyle = UITableViewCellSeparatorStyleNone;
    letfTableV.sectionFooterHeight = 5;
    letfTableV.sectionHeaderHeight = 5;
    
    letfTableV.contentInset = UIEdgeInsetsMake(-35, 0, 0, 0);
    
    [self.bottomScollView addSubview:letfTableV];
    self.letfTableV = letfTableV;
    
    //美辑
    UITableView *rightTableV = [[UITableView alloc] initWithFrame:CGRectMake(screenW, 0, screenW, self.bottomScollView.height) style:UITableViewStylePlain];
    rightTableV.dataSource = self;
    rightTableV.delegate = self;
    rightTableV.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.bottomScollView addSubview:rightTableV];
    self.rightTableV = rightTableV;
    
    
    //[self.letfTableV setContentInset:UIEdgeInsetsMake(64, 0, 0, 0)];
    //[self.rightTableV setContentInset:UIEdgeInsetsMake(64, 0, 0, 0)];
    
}
//城市点击
- (void)cityClick:(UIButton *)btn {
    XQChooseCityViewController *chooseCVC = [[XQChooseCityViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:chooseCVC];
    [self presentViewController:nav animated:YES completion:nil];
}
//附近点击
- (void)nearClick {
    XQNearViewController *nearVC = [[XQNearViewController alloc] init];
    [self.navigationController pushViewController:nearVC animated:YES];
}
/**
 *  点击标题按钮时调用
 *
 *  @param titleView 标题View
 *  @param btnIndex  当前点击按钮的角标
 */
- (void)foundTitleView:(XQFoundTitleView *)titleView didClickBtnIndex:(NSInteger)btnIndex {
    //跳转到指写的tableView
    [self.bottomScollView setContentOffset:CGPointMake(screenW * btnIndex, 0) animated:YES];
}
/**
 *  当ScrollView停止滚动时, 让标题View底部线滚动
 *
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    //计算当前是第几页
    if (scrollView == self.bottomScollView) {
        int pageIndex = scrollView.contentOffset.x / screenW;
        
        XQFoundTitleView *titleView = (XQFoundTitleView *)self.navigationItem.titleView;
        [titleView bottomLineScollIndex:pageIndex];
    }
}

#pragma mark - 共有多少组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    if (tableView == self.letfTableV) {
        return self.leftData.count;
    }else {
        return 1;
    }
}

#pragma mark - 每一组有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (tableView == self.letfTableV) {
        //取出当前所在的组模型
        XQBeautifulDayItem *item = self.leftData[section];
        if (item.themes.count > 0) {
            return 2;
        }else {
            return 1;
        }
    }else {
        return self.themeData.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView == self.letfTableV) {
        
        if (indexPath.row == 1) {
            
            //取出当前所在的组模型
            XQBeautifulDayItem *item = self.leftData[indexPath.section];
            
            XQThemesCell *cell = [XQThemesCell cellWithTableView:tableView];
            cell.themeItem = item.themes[0];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
            
        }else {
            //取出当前所在的组模型
            XQBeautifulDayItem *item = self.leftData[indexPath.section];
            XQEventCell *cell = [XQEventCell cellWithTableView:tableView];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.beautifulDayItem = item;
            return cell;
        }
        
    }else {

        XQThemesCell *cell = [XQThemesCell cellWithTableView:tableView];
        XQThemesItem *themeItem = self.themeData[indexPath.row];
        cell.themeItem = themeItem;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
        
    }
    
  
}

//返回每一行的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    //如果是左边
    if (tableView == self.letfTableV) {
        //是第一行
        if( indexPath.row == 1) {
            return 220;
        } else {
            //第0行
            return 253;
        }
       
    } else {
        return 240;
    }
}
//点击执行Cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView == self.letfTableV) {
        
        if (indexPath.row == 1) {
            
        }else {
            //取出当前行模型
            XQBeautifulDayItem *item = self.leftData[indexPath.section];
            XQBeautifulDayDetail *detailVC = [[XQBeautifulDayDetail alloc] init];
            detailVC.beautifulDayItem = item;
            
            //跳转到美天详情控制器
            [self.navigationController pushViewController:detailVC animated:YES];
        }
    }else {
        
    }
    
}

@end
