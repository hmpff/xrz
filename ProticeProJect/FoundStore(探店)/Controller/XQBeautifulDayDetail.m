//
//  ProticeProJect.pch
//  ProticeProJect
//
//  Created by XQ_明鹏 on 15/8/5.
//  Copyright © 2015年 明鹏. All rights reserved.
//

#import "XQBeautifulDayDetail.h"
#import "XQFoundTitleView.h"
#import "UIImage+Image.h"
#import "UIImageView+WebCache.h"

#import "XQShowDetailContentView.h"
#import "XQBeautifulDayItem.h"
#import "XQEventsItem.h"

#import "XQShareView.h"
#import "XQCoverView.h"



//头部图片的高度
#define topImageH 255
//中间View的高度
#define shopViewH 45

#define oriY -300
#define topImageY 0

@interface XQBeautifulDayDetail ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate,XQFoundTitleViewDelegate>

//头部图片
@property (nonatomic, weak) UIImageView *topImageV;
//中间滚动标题
@property (nonatomic,weak) XQFoundTitleView *shopT;

//显示的商店详情
@property (nonatomic, weak) XQShowDetailContentView *shopDetailV;

//显示的列表
@property (nonatomic ,weak)UITableView *tableView;
//最后一次的偏移量
@property (nonatomic, assign) CGFloat lastOffsetY;

//底部滚动scrollView
@property (nonatomic, weak)  UIScrollView *detailSV;

//自定义的导航条
@property (nonatomic,weak) UIView *nav;

//返回按钮
@property (nonatomic,weak) UIButton *backBtn;
//分享按钮
@property (nonatomic,weak) UIButton *shareBtn;
//收藏按钮
@property (nonatomic,weak) UIButton *collectionBtn;

//分享view
@property (nonatomic, weak)XQShareView *shareV;


@end

@implementation XQBeautifulDayDetail

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置UI
    [self setUp];
    //设置导航条
    [self setNav];
    //设置数据
    [self setUpData];
}


//设置导航条
- (void)setNav {
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationController.navigationBar.hidden = YES;
    
    //创建导航条
    UIView *nav = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenW, 64)];
    nav.backgroundColor = [UIColor whiteColor];
    nav.alpha = 0;
    self.nav = nav;
    [self.view addSubview:nav];
    
    //自定义按钮的大小
    CGFloat btnWH = 44;
    //设置导航条内容
    //返回按钮
    UIButton *backBtn = [self setBtnWithRect:CGRectMake(-7, 20, btnWH, btnWH) imageName:@"back_0" highlightedImageName:@"back_1" action:@selector(back)];
    [self.view addSubview:backBtn];
    self.backBtn = backBtn;
    
    //分享按钮
    UIButton *shareBtn = [self setBtnWithRect:CGRectMake(screenW - btnWH - 10, 20, btnWH, btnWH) imageName:@"share_0" highlightedImageName:@"share_1" action:@selector(shareBtnClick)];
    [self.view addSubview:shareBtn];
    self.shareBtn = shareBtn;
    
    //收藏按钮
    UIButton *collectionBtn = [self setBtnWithRect:CGRectMake(shareBtn.x - btnWH, 20, btnWH, btnWH) imageName:@"collect_0" highlightedImageName:@"collect_2" action:@selector(collectionBtnClick:)];
    [self.view addSubview:collectionBtn];
    self.collectionBtn = collectionBtn;
    
    
    
    
    
}
//返回上一级
- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}

//收藏点击
- (void)collectionBtnClick:(UIButton *)btn {
    
    btn.selected = !btn.selected;
}
//创建点击
- (void)shareBtnClick {

    //显示遮盖
    XQCoverView *coverV = [XQCoverView show];
    
    //显示分享
    XQShareView *shareV = [XQShareView shareView];
    shareV.width = screenW;
    __weak typeof(XQCoverView) *weakSelf = coverV;
    //点击遮盖时要做的事
    coverV.clickTask = ^{
        [UIView animateWithDuration:0.25 animations:^{
            //把分享view移动最底部
            shareV.y = screenH;
        } completion:^(BOOL finished) {
            //动画完成时移除分享和遮盖
            [shareV removeFromSuperview];
            [weakSelf removeFromSuperview];
        }];
    };
    
}
//添加控件
- (void)setUp {
  

    //添加scrollView
    UIScrollView *detailSV = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
  
    detailSV.showsHorizontalScrollIndicator = YES;
    detailSV.backgroundColor = XQColor(245, 254, 245, 1);
    detailSV.alwaysBounceVertical = YES;
    detailSV.delegate = self;
    detailSV.bounces = YES;
    
    detailSV.contentInset = UIEdgeInsetsMake(topImageH + shopViewH, 0, 0, 0);
    [self.view addSubview:detailSV];
    detailSV.contentSize = CGSizeMake(screenW, 1 * screenH);
    self.detailSV = detailSV;
    
    UITableView *tableV = [[UITableView alloc] init];
    tableV.frame = CGRectMake(0, 0, screenW, screenH);
    tableV.contentInset =  UIEdgeInsetsMake(topImageH + shopViewH, 0, 0, 0);
    tableV.showsHorizontalScrollIndicator = NO;
    tableV.dataSource = self;
    tableV.delegate = self;
    
    self.tableView = tableV;
    [self.view addSubview:tableV];
    
    
    //添加头部图片
    UIImageView *topImageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, screenW, topImageH)];
    topImageV.image = [UIImage imageNamed:@"quesheng"];
    topImageV.contentMode = UIViewContentModeScaleToFill;
    topImageV.clipsToBounds = YES;
    [self.view addSubview:topImageV];
    self.topImageV = topImageV;
    
    //添加中部滚动标题
    XQFoundTitleView *shopT = [[XQFoundTitleView alloc] initWithTitleArray:@[@"美天",@"美辑"]];
    shopT.backgroundColor = [UIColor whiteColor];
    shopT.frame =  CGRectMake(0, topImageH, screenW, shopViewH);
    shopT.delegate = self;
    [self.view addSubview:shopT];
    self.shopT = shopT;
    
    //添加底部View
    XQShowDetailContentView *shopDetailV = [XQShowDetailContentView showDetailContentView];
    shopDetailV.y = 0;
    shopDetailV.width = screenW;
    shopDetailV.backgroundColor = XQColor(245, 245, 245, 1);
    [detailSV addSubview:shopDetailV];
    self.shopDetailV = shopDetailV;
}
//设置数据
- (void)setUpData {

    XQEventsItem *eventItem =  self.beautifulDayItem.events.lastObject;
    //设置顶部图片
    NSURL *url = [NSURL URLWithString:eventItem.imgs.lastObject];
    [self.topImageV sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"quesheng"]];
    //设置店铺详情
    self.shopDetailV.events = eventItem;
    
}


//监听ScrollView滚动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    NSLog(@"-------%f",scrollView.contentOffset.y);
     CGFloat offsetY =  scrollView.contentOffset.y - oriY;
    
    //获取偏移量
    if (offsetY >= 0) {
        //移动头部图片
        self.topImageV.y  = -offsetY;
    }else {
        //放大图片
        self.topImageV.y  = 0;
        self.topImageV.width = screenW - 2 * offsetY;
        self.topImageV.x = offsetY;
        self.topImageV.height = topImageH - offsetY;
    }
    
    //当显示导航条时
    if (offsetY > 191) {
        //设置导航条上图片变化
        self.backBtn.selected = YES;
        self.shareBtn.selected = YES;
        [self.collectionBtn setImage:[UIImage imageNamed:@"collect_1"] forState:UIControlStateNormal];
        //中间标题View的y值一直为64
        self.shopT.y = navH;
    }else {
        //设置导航条上图片变化
        self.backBtn.selected = NO;
        [self.collectionBtn setImage:[UIImage imageNamed:@"collect_0"] forState:UIControlStateNormal];
        self.shareBtn.selected = NO;
        //中间标题View的y值为头部图片的最大Y值
        self.shopT.y = CGRectGetMaxY(self.topImageV.frame);
    }
 
    //设置导航条透明度
    CGFloat alpha = offsetY * 1 / 191.0;
    self.nav.alpha = alpha;
    
    //记录偏移量
    self.lastOffsetY = scrollView.contentOffset.y;
    NSLog(@"self.lastOffsetY==%f",self.lastOffsetY);
    
}

- (void)foundTitleView:(XQFoundTitleView *)titleView didClickBtnIndex:(NSInteger)btnIndex {
    
    //点击第0个标题
    if (btnIndex == 0) {
        //列表隐藏
        self.tableView.hidden = YES;
        //详情View显示
        self.shopDetailV.hidden = NO;
        
        if (self.lastOffsetY > self.detailSV.contentSize.height - screenH) {
            
            [self.detailSV setContentOffset:CGPointMake(0, self.detailSV.contentSize.height - screenH - 100) animated:NO];
        } else {
            [self.detailSV setContentOffset:CGPointMake(0, self.lastOffsetY) animated:NO];
        }
        
    }else {
        
        self.shopDetailV.hidden = YES;
        self.tableView.hidden = NO;
        
        if (self.lastOffsetY > self.tableView.contentSize.height + screenH) {
            
            [self.tableView setContentOffset:CGPointMake(0, self.tableView.contentSize.height) animated:NO];
        } else {
            [self.tableView setContentOffset:CGPointMake(0, self.lastOffsetY) animated:NO];
        }
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    cell.textLabel.text = @"gxq";
    return cell;
}

/**
 *  创建一个按钮
 *
 *  @param rect          按钮的大小
 *  @param imageName     按钮图片的名称
 *  @param highlightName 按钮高亮状态下图片的名称
 *  @param selector      点击按钮调用的方法
 */
- (UIButton *)setBtnWithRect:(CGRect)rect imageName:(NSString *)imageName highlightedImageName:(NSString *)highlightName action:(SEL)selector{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = rect;
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highlightName] forState:UIControlStateSelected];
    [btn addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

@end
