//
//  CollectionViewController.m
//  CollectionViewAnimation
//
//  Created by 石燚 on 16/7/1.
//  Copyright © 2016年 SingYi. All rights reserved.
//

#import "CollectionViewController.h"
#import "ACell.h"

@interface CollectionViewController ()<UIScrollViewDelegate>

@end

@implementation CollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.collectionView registerClass:[ACell class] forCellWithReuseIdentifier:reuseIdentifier];
    
}




#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

- (ACell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ACell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.backgroundColor = [self randomColor];
    cell.str = @"interesting";
    
    return cell;
}

- (UIColor *)randomColor {
    
    UIColor *color = [UIColor colorWithRed:(arc4random() % 255) / 255.0 green:(arc4random() % 255) / 255.0 blue:(arc4random() % 255) / 255.0 alpha:1];
    
    return color;
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    NSLog(@"%lf",scrollView.contentOffset.y / 100);
    
    NSArray<ACell *> *cells = [self.collectionView visibleCells];
    
    [cells enumerateObjectsUsingBlock:^(ACell * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj cellAnimation];
        
    }];
}



@end
