//
//  HomePageController.m
//  大将军_项目
//
//  Created by 石燚 on 16/5/26.
//  Copyright © 2016年 石燚. All rights reserved.
//

#import "HomePageController.h"
#import "DateCell.h"
#import "DateViewLayout.h"

#define kSCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define kSCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface HomePageController ()<UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UICollectionView *dateView;
@property (nonatomic, strong) DateViewLayout *flowLayout;

@property (nonatomic, strong) UILabel *messageLabel;

//暂时测试的
@property (nonatomic, strong) UITableView *testTableview;

- (void)initUserInterface;

@end

@implementation HomePageController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initUserInterface];

}

- (void)initUserInterface {
    [self.view addSubview:self.dateView];
    
    [self.view addSubview:self.messageLabel];
    
    [self.view addSubview:self.testTableview];
}


#pragma mark - 懒加载

- (UILabel *)messageLabel {
    if (!_messageLabel) {
        _messageLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, kSCREEN_HEIGHT * 0.25, kSCREEN_WIDTH, kSCREEN_HEIGHT * 0.15)];
        _messageLabel.text = @"test";
        _messageLabel.textAlignment = NSTextAlignmentCenter;
        _messageLabel.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1];
    }
    return _messageLabel;
}


#pragma mark - 滚动视图
- (UITableView *)testTableview {
    if (!_testTableview) {
        _testTableview = [[UITableView alloc]initWithFrame:CGRectMake(0, kSCREEN_HEIGHT * 0.4, kSCREEN_WIDTH, kSCREEN_HEIGHT * 0.6 - 49) style:(UITableViewStyleGrouped)];
        _testTableview.backgroundColor = [UIColor colorWithWhite:1 alpha:1];
        
        _testTableview.delegate = self;
        _testTableview.dataSource = self;
        
        //注册原型cell
        [_testTableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"test"];
    }
    return _testTableview;
}

#pragma mark - tableViewDataSourceAndDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"test" forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    
    return cell;
}



#pragma mark - 日期视图
- (DateViewLayout *)flowLayout {
    if (!_flowLayout) {
        _flowLayout = [[DateViewLayout alloc]init];
        
        //设置大小
        _flowLayout.itemSize = CGSizeMake(kSCREEN_WIDTH / 5, kSCREEN_WIDTH / 5);
        
        //设置方向
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
    }
    
    return _flowLayout;
}


- (UICollectionView *)dateView {
    if (!_dateView) {
        
        _dateView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 20, kSCREEN_WIDTH, kSCREEN_HEIGHT * 0.25) collectionViewLayout:self.flowLayout];
        
        _dateView.delegate = self;
        _dateView.dataSource = self;
        
        _dateView.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.8];
        
        _dateView.bounces = YES;
        
        _dateView.showsHorizontalScrollIndicator = NO;
        //注册原型cell
        [_dateView registerClass:[DateCell class] forCellWithReuseIdentifier:@"interesting"];
    }
    return _dateView;
}

#pragma mark - DateViewDelegateAndDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 31;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    DateCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"interesting" forIndexPath:indexPath];
    
    cell.layer.cornerRadius = 10;
    cell.layer.masksToBounds = YES;
    
    cell.backgroundColor = [self specialRandomColor];
    
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%ld",indexPath.row);
    
    
    NSInteger idx = indexPath.row;

    [self.dateView setContentOffset:CGPointMake((idx - 2) * kSCREEN_WIDTH / 5, 0) animated:YES];
    

    
}

- (UIColor *)specialRandomColor {
    
    CGFloat hue = arc4random() % 256 / 256.0 ;  //  0.0 to 1.0
    CGFloat saturation = arc4random() % 128 / 256.0 + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = arc4random() % 128 / 256.0 + 0.5;  //  0.5 to 1.0, away from black
    
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
