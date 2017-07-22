//
//  ProticeProJect.pch
//  ProticeProJect
//
//  Created by XQ_明鹏 on 15/8/5.
//  Copyright © 2015年 明鹏. All rights reserved.
//
#import "XQClassifViewController.h"
#import "XQCityHeadView.h"
#import "XQClassifyCell.h"
#import "XQClassifyItem.h"

#import "XQClassifyDetailItem.h"


@interface XQClassifViewController ()

@property (nonatomic, strong) NSMutableArray *classifyArray;

@end

@implementation XQClassifViewController

- (NSMutableArray *)classifyArray {
    
    if (_classifyArray == nil) {
        _classifyArray = [XQClassifyItem getClassifyData];
        
    }
    return _classifyArray;
}

- (instancetype)init {
    UICollectionViewFlowLayout *fL = [[UICollectionViewFlowLayout alloc] init];
    
    //初始化colletionView的布局
    CGFloat margin = 10;
    NSLog(@"%f",screenW);
    CGFloat itemW = (screenW - 4 * margin) / 3;
    if (screenW > 375.0) {
        itemW  = itemW - 3;
    }
    CGFloat itemH = 80;
    
    // cell的大小
    fL.itemSize = CGSizeMake(itemW, itemH);
    fL.minimumLineSpacing = 10;
    fL.minimumInteritemSpacing = 10;
    fL.sectionInset = UIEdgeInsetsMake(margin, margin, margin, margin);
    //每个headView的大小
    fL.headerReferenceSize = CGSizeMake(screenW, 60);
    
    //fL.sectionInset = UIEdgeInsetsMake(20, 0, 20,0);
    return [super initWithCollectionViewLayout:fL];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"分类";
    self.collectionView.backgroundColor = XQColor(243, 243, 243, 1);
    
    
    //通过注册NIB文件
    [self.collectionView registerNib:[UINib nibWithNibName:@"XQClassifyCell" bundle:nil] forCellWithReuseIdentifier:@"ClassifyCell"];
    
    
    
     [self.collectionView registerClass:[XQCityHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headV"];
    
    self.collectionView.alwaysBounceVertical = YES;
    
    
    
    //添加长按手势
    UILongPressGestureRecognizer *longP = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longP:)];
    [self.collectionView addGestureRecognizer:longP];
    
    
    
    
    
    
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
    
        XQClassifyItem *classifyItem = self.classifyArray[sourceIndexPath.section];
        //取出源item数据
        XQClassifyDetailItem *detailItem = [classifyItem.tags objectAtIndex:sourceIndexPath.row];
    
        //从资源数组中移除该数据
        [classifyItem.tags removeObject:detailItem];
        NSLog(@"destinationIndexPath===%ld",destinationIndexPath.row);
    
    
        //取出目标组
        XQClassifyItem *classifyItem2 = self.classifyArray[destinationIndexPath.section];
        //将数据插入到资源数组中的目标位置上
        [classifyItem2.tags insertObject:detailItem atIndex:destinationIndexPath.row];
    
    
        NSLog(@"sourceIndexPath==%@",sourceIndexPath);
        NSLog(@"destinationIndexPath==%ld",destinationIndexPath.item);

}

//数据源代理方法
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.classifyArray.count;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    XQClassifyItem *item  = self.classifyArray[section];
    return item.tags.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    XQClassifyCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ClassifyCell" forIndexPath:indexPath];
    XQClassifyItem *item  = self.classifyArray[indexPath.section];
    if (indexPath.row > item.tags.count - 1) {
        return cell;
    }
    XQClassifyDetailItem *detailItem = item.tags[indexPath.row];
    cell.detailItem = detailItem;
    
    return cell;
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        
        XQCityHeadView *headV = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headV" forIndexPath:indexPath];
        
        XQClassifyItem *item  = self.classifyArray[indexPath.section];
        
        headV.titleName= item.title;

        return headV;
        
    }else {
        return nil;
    }
}





@end
