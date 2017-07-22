//
//  XQExperienceViewController.m
//  ProticeProJect
//
//  Created by 弓虽_子 on 16/5/5.
//  Copyright © 2016年 弓虽_子. All rights reserved.
//

#import "XQExperienceViewController.h"
#import "XQExperienceHeaderV.h"
#import "XQExperienceCell.h"

#import "XQBeautifulDayItem.h"
#import "XQThemesItem.h"
#import "XQEventsItem.h"

@interface XQExperienceViewController ()

@property (nonatomic, strong) NSArray *dataArray;

@property (nonatomic, weak)UIView *headerV;

@end

@implementation XQExperienceViewController

-(NSArray *)dataArray {
    
    if (_dataArray == nil) {
        _dataArray = [XQBeautifulDayItem getMessage];
    }
    return _dataArray;
}

- (instancetype)init {
    UICollectionViewFlowLayout *fL = [[UICollectionViewFlowLayout alloc] init];
    
    //初始化colletionView的布局
    CGFloat margin = 10;
    // cell的大小
    CGFloat itemW = (screenW - 3 * margin) / 2;
    if (screenW > 375.0) {
        itemW  = itemW - 3;
    }
    
    fL.itemSize = CGSizeMake(itemW, 150);
    fL.minimumLineSpacing = 10;
    fL.minimumInteritemSpacing = 10;
    fL.sectionInset = UIEdgeInsetsMake(margin, margin, margin, margin);
    //每个headView的大小
    fL.headerReferenceSize = CGSizeMake(screenW, 232);
    
    //fL.sectionInset = UIEdgeInsetsMake(20, 0, 20,0);
    return [super initWithCollectionViewLayout:fL];
    
}



static NSString *headerID = @"experHeaderVID";
static NSString *experCellID = @"XQExperienceCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    
     self.collectionView.backgroundColor = XQColor(243, 243, 243, 1);
 
    [self.collectionView registerNib:[UINib nibWithNibName:@"XQExperienceCell" bundle:nil] forCellWithReuseIdentifier:experCellID];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"XQExperienceHeaderV" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerID];

    self.title = @"体验";
    
//    self.automaticallyAdjustsScrollViewInsets = NO;
//    self.collectionView.contentInset = UIEdgeInsetsMake(284, 0, 0, 0);
//    
//    CGFloat margin = 10;
//    UIView *headerV = [[UIView alloc] init];
//    headerV.frame = CGRectMake(margin, 74, screenW - 2 * margin, 200);
//    headerV.backgroundColor = [UIColor redColor];
//    [self.view addSubview:headerV];
//    self.headerV = headerV;
    
}

#define oriY -284
//监听ScrollView滚动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat offsetY =  scrollView.contentOffset.y - oriY;
    self.headerV.y = 74 + -offsetY;
    
}


//数据源代理方法
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.dataArray.count;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    XQBeautifulDayItem *item  = self.dataArray[section];
    NSLog(@"%ld",item.themes.count);
    return item.themes.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    XQExperienceCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:experCellID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
     XQBeautifulDayItem *item  = self.dataArray[indexPath.section];
     XQThemesItem *themeItem = item.themes[indexPath.row];
     cell.themeItem = themeItem;
    
    return cell;
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        
        XQExperienceHeaderV *headV = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerID forIndexPath:indexPath];
        headV.width = screenW;
        
        XQBeautifulDayItem *item  = self.dataArray[indexPath.section];
        XQEventsItem *eventItem = item.events[0];
        headV.eventItem = eventItem;
        headV.backgroundColor = [UIColor clearColor];
        return headV;
        
    }else {
        return nil;
    }
}


//




@end
