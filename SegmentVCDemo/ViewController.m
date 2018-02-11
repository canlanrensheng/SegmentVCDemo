//
//  ViewController.m
//  SegmentVCDemo
//
//  Created by 张金山 on 2018/2/7.
//  Copyright © 2018年 张金山. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
#import "TopButtonView.h"
#import "Header.h"

#define SegMentViewHeight 50

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, weak) UICollectionView *collectionMain;
@property (nonatomic ,strong) NSArray *itemsArray;
@property (nonatomic, strong) NSArray *controllersClass;
@property (nonatomic, strong) NSMutableArray *controllers;

@property (nonatomic,strong) TopButtonView *topButtonView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpNaviAttributes];
    [self createCollectionView];
    
}

- (void)setUpNaviAttributes{
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    self.navigationItem.title = @"SegmentVCDemo";
    
    self.itemsArray = @[@"第一页",
                        @"第二页",
                        @"第三页",
                        @"第四页"];
    self.controllersClass = @[@"FirstViewController",@"FirstViewController",@"FirstViewController",@"FirstViewController"];
}

- (void)createCollectionView{
    UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc]init];
    flowlayout.minimumInteritemSpacing = 2;
    flowlayout.minimumLineSpacing = 2;
    CGRect frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height );
    [flowlayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    UICollectionView *collectionMain = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:flowlayout];
    collectionMain.backgroundColor = [UIColor colorWithRed:240/255.0f green:240/255.0f blue:240/255.0f alpha:1];
    collectionMain.dataSource = self;
    collectionMain.delegate = self;
    collectionMain.pagingEnabled = YES;
    
    collectionMain.bounces = NO;
    collectionMain.scrollEnabled = NO;
    collectionMain.showsHorizontalScrollIndicator = NO;
    [collectionMain registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    if (@available(iOS 11.0, *)) {
        collectionMain.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    self.collectionMain = collectionMain;
    
    [self.view addSubview:collectionMain];
    [self.view bringSubviewToFront:collectionMain];
    
    [self.view addSubview:self.topButtonView];
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return collectionView.frame.size;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

#pragma mark - UICollectionViewDataSource && UICollectionViewDelegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.itemsArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    UIViewController * vc = self.controllers[indexPath.row];
    [vc.view removeFromSuperview];
    [cell.contentView addSubview:vc.view];
    vc.view.frame = cell.bounds;
    return cell;
}

- (NSMutableArray *)controllers{
    if (!_controllers) {
        NSMutableArray *controllers = [NSMutableArray array];
        for(int i = 0; i < _itemsArray.count;i++){
            FirstViewController *brandVC = [[FirstViewController alloc] init];
            brandVC.title = _itemsArray[i];
            [self addChildViewController:brandVC];
            [controllers addObject:brandVC];
            brandVC.textTitle = _itemsArray[i];
        }
        _controllers = controllers;
    }
    return _controllers;
}

- (TopButtonView *)topButtonView{
    if(!_topButtonView){
        _topButtonView = [[TopButtonView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, SegMentViewHeight) withTitleArray:self.itemsArray];
        _topButtonView.selectTitleColor = [UIColor orangeColor];
        _topButtonView.titleColor = [UIColor darkGrayColor];
        _topButtonView.showBottomLine = YES;
        @weakify(self);
        [_topButtonView.clickSubject subscribeNext:^(id x) {
            @strongify(self);
            //定位到相应的控制器
            [self setSelectedBtnWithIndex:[x integerValue]];
        }];
    }
    return _topButtonView;
}

//点击插板进行的操作
- (void)setSelectedBtnWithIndex:(NSInteger)selectIndex{
    //设置滚动
    [self.collectionMain scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:selectIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    
}

@end
