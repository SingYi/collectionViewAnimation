//
//  DateViewLayout.h
//  大将军_项目
//
//  Created by 石燚 on 16/6/2.
//  Copyright © 2016年 石燚. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DateViewLayout : UICollectionViewLayout

- (instancetype)init;

@property (nonatomic) CGSize itemSize;
@property (nonatomic) NSInteger visibleCount;
@property (nonatomic) UICollectionViewScrollDirection scrollDirection;


@end
