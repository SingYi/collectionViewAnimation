//
//  ACell.m
//  CollectionViewAnimation
//
//  Created by 石燚 on 16/7/1.
//  Copyright © 2016年 SingYi. All rights reserved.
//

#import "ACell.h"

@interface ACell ()


@end

@implementation ACell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        [self.contentView addSubview:self.textLabel1];
        _oriCenter = self.center;
        
    }
    return self;
}

#pragma mark - getter
- (UILabel *)textLabel1 {
    if (!_textLabel1) {
        _textLabel1 = [[UILabel alloc]initWithFrame:self.bounds];
        _textLabel1.textAlignment = NSTextAlignmentCenter;
        _textLabel1.text = @"interesting";
        _textLabel1.font = [UIFont boldSystemFontOfSize:30];
        _textLabel1.textAlignment = NSTextAlignmentCenter;
    }
    return _textLabel1;
}

- (void)setStr:(NSString *)str {
    self.textLabel1.text = str;
}

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    [super applyLayoutAttributes:layoutAttributes];
    
    
}

- (void)cellAnimation {
        
    CGRect centerToWindow = [self convertRect:self.bounds toView:self.window];
    
    CGFloat centerY = CGRectGetMidY(centerToWindow);
    
    self.textLabel1.transform = CGAffineTransformMakeRotation(-centerY / 50);
        
    self.transform = CGAffineTransformMakeRotation(centerY / 50);
    
    
}

- (void)cellAnimation1 {
    
    self.alpha = 0;
    
    self.center = CGPointMake([UIScreen mainScreen].bounds.size.width / 2, [UIScreen mainScreen].bounds.size.height / 2);
    
    NSInteger test = arc4random() % 10 + 1;
    
    self.transform = CGAffineTransformMakeRotation(M_PI / test);
    
    [UIView animateWithDuration:2 animations:^{
        self.center = _oriCenter;
        self.transform = CGAffineTransformIdentity;
        self.alpha = 1;
    }];
    
}









@end
