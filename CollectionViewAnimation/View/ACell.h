//
//  ACell.h
//  CollectionViewAnimation
//
//  Created by 石燚 on 16/7/1.
//  Copyright © 2016年 SingYi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ACell : UICollectionViewCell

@property (nonatomic, strong) UILabel *textLabel1;
@property (nonatomic, strong) NSString *str;

@property (nonatomic, assign) CGPoint oriCenter;

- (void)cellAnimation;

- (void)cellAnimation1;

@end
