//
//  InViewController.m
//  CollectionViewAnimation
//
//  Created by 石燚 on 16/7/1.
//  Copyright © 2016年 SingYi. All rights reserved.
//

#import "InViewController.h"
#import "ACell.h"

@interface InViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, assign) NSInteger numbernOfcells;

@end

@implementation InViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSArray<ACell *> *cells = [self.collectionView visibleCells];
    [cells enumerateObjectsUsingBlock:^(ACell * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [obj cellAnimation1];
    }];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
    [self.view addSubview:self.collectionView];
    
    _numbernOfcells = 10;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.numbernOfcells;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ACell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ttt" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor orangeColor];
    cell.str = @"";
    
    [cell cellAnimation1];
    
    return cell;
}




- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        
        layout.minimumLineSpacing = 5;
        layout.minimumInteritemSpacing = 5;
        layout.itemSize = CGSizeMake(self.view.bounds.size.width / 9, self.view.bounds.size.width / 9);
        
        _collectionView = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:layout];
        
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        [_collectionView registerClass:[ACell class] forCellWithReuseIdentifier:@"ttt"];
        
    }
    return _collectionView;
}







@end




