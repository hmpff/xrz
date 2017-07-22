//
//  ProticeProJect.pch
//  ProticeProJect
//
//  Created by XQ_明鹏 on 15/8/5.
//  Copyright © 2015年 明鹏. All rights reserved.
//

#import "XQChooseCityViewController.h"
#import "XQCityHeadView.h"
#import "XQCityCell.h"

@interface XQChooseCityViewController ()

@property (nonatomic, strong) NSMutableArray *city;
@property (nonatomic, strong) NSMutableArray *foreignCity;

@property (nonatomic,strong) NSMutableArray *cityArray;


@end

@implementation XQChooseCityViewController




- (NSMutableArray *)city {
    
    if (_city == nil) {
        NSMutableArray *cityArray = [NSMutableArray arrayWithArray:@[@"北京", @"上海", @"成都", @"广州", @"杭州", @"西安", @"重庆", @"厦门", @"台北"]];
        _city = cityArray;
    }
    return _city;
}


- (NSMutableArray *)foreignCity {
    
    if (_foreignCity == nil) {
        
        NSMutableArray *cityArray = [NSMutableArray arrayWithArray:@[@"罗马", @"迪拜", @"里斯本", @"巴黎", @"柏林", @"伦敦"]];
        _foreignCity = cityArray;
    }
    return _foreignCity;
}



- (instancetype)init {
    UICollectionViewFlowLayout *fL = [[UICollectionViewFlowLayout alloc] init];

    //初始化colletionView的布局
    CGFloat itemW = screenW / 3.0 - 1.0;
    CGFloat itemH = 50;
    
    // cell的大小
    fL.itemSize = CGSizeMake(itemW, itemH);
    fL.minimumLineSpacing = 1;
    fL.minimumInteritemSpacing = 1;
    //每个headView的大小
    fL.headerReferenceSize = CGSizeMake(screenW, 60);
    
    //fL.sectionInset = UIEdgeInsetsMake(20, 0, 20,0);
    return [super initWithCollectionViewLayout:fL];
    
}


static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"选择城市";

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:0 target:self action:@selector(cancle)];
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    
    self.collectionView.backgroundColor = XQColor(247, 247, 247, 1);
    [self.collectionView registerClass:[XQCityCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    
    [self.collectionView registerClass:[XQCityHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headV"];
    
    self.collectionView.alwaysBounceVertical = YES;
    
    //添加长按手势
    UILongPressGestureRecognizer *longP = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longP:)];
    [self.collectionView addGestureRecognizer:longP];
    
    
    self.automaticallyAdjustsScrollViewInsets = NO;

    
}


- (void)longP:(UILongPressGestureRecognizer *)longGesture {
    
    //判断手势状态
    switch (longGesture.state) {
        case UIGestureRecognizerStateBegan:{
            //判断手势落点位置是否在路径上
            NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:[longGesture locationInView:self.collectionView]];
            if (indexPath == nil) {
                break;
            }
            //在路径上则开始移动该路径上的cell
            [self.collectionView beginInteractiveMovementForItemAtIndexPath:indexPath];
        }
            break;
        case UIGestureRecognizerStateChanged:
            //移动过程当中随时更新cell位置
            [self.collectionView updateInteractiveMovementTargetPosition:[longGesture locationInView:self.collectionView]];
            break;
        case UIGestureRecognizerStateEnded:
            //移动结束后关闭cell移动
            [self.collectionView endInteractiveMovement];
            break;
        default:
            [self.collectionView cancelInteractiveMovement];
            break;
    }
}


- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath{
    //返回YES允许其item移动
    return YES;
}


- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath*)destinationIndexPath {
    
    if (sourceIndexPath.section == 0) {
         //取出源item数据
        NSString *city = [self.city objectAtIndex:sourceIndexPath.item];
        //从资源数组中移除该数据
        [self.city removeObject:city];
        //将数据插入到资源数组中的目标位置上
        [self.city insertObject:city atIndex:destinationIndexPath.item];
    }else {
        //取出源item数据
        NSString *city = [self.foreignCity objectAtIndex:sourceIndexPath.item];
        //从资源数组中移除该数据
        [self.foreignCity removeObject:city];
        //将数据插入到资源数组中的目标位置上
        [self.foreignCity insertObject:city atIndex:destinationIndexPath.item];
    }
}





//设置导航条
//注册View
//取消按钮点击
- (void)cancle {
    [self dismissViewControllerAnimated:YES completion:nil];
}


//数据源代理方法
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    if (section == 0) {
        return self.city.count;
    } else {
        return self.foreignCity.count;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    XQCityCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
     cell.backgroundColor = [UIColor whiteColor];
    if (indexPath.section == 0) {
       
        cell.cityName =  self.city[indexPath.row];;
       
    }else {
         cell.cityName =  self.foreignCity[indexPath.row];;
    }
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        
       XQCityHeadView *headV = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headV" forIndexPath:indexPath];
        
        if (indexPath.section == 0) {
            headV.titleName= @"国内城市";
        } else {
            headV.titleName = @"国外城市";
        }
        return headV;
        
    }else {
        return nil;
    }
}










@end
