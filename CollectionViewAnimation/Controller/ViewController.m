//
//  ViewController.m
//  CollectionViewAnimation
//
//  Created by 石燚 on 16/7/1.
//  Copyright © 2016年 SingYi. All rights reserved.
//

#import "ViewController.h"
#import "ACell.h"
#import "TableViewCell.h"
#import "CollectionViewController.h"
#import "InViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableview;
@property (nonatomic, strong) NSArray *cellArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUserInterface];
    
    
}

- (void)initUserInterface {
    [self.view addSubview:self.tableview];
}


#pragma mark - dataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cellArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"qwer"];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row + 1];
    
    return cell;
}

#pragma mark - delegate 

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.row) {
        case 0: {
            UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
            
            layout.itemSize = CGSizeMake(self.view.bounds.size.width / 2, self.view.bounds.size.width / 2);
            
            layout.minimumLineSpacing = self.view.bounds.size.width / 3;
            layout.minimumInteritemSpacing = self.view.bounds.size.width / 3;
            layout.scrollDirection = UICollectionViewScrollDirectionVertical;
            
            
            CollectionViewController *collectionview = [[CollectionViewController alloc]initWithCollectionViewLayout:layout];;

            
            collectionview.typeInteger = indexPath.row;
            
            
            [self.navigationController pushViewController:collectionview animated:YES];
            
            break;
        }
        case 1: {
            InViewController *ivc = [InViewController new];
            
            [self.navigationController pushViewController:ivc animated:YES];
            break;
        }
        default:
            break;
    }

    
}


#pragma mark - getter

- (UITableView *)tableview {
    if (!_tableview) {
        _tableview = [[UITableView alloc]initWithFrame:self.view.frame];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        
        [_tableview registerClass:[TableViewCell class] forCellReuseIdentifier:@"qwer"];
        
    }
    return _tableview;
}

- (NSArray *)cellArray {
    if (!_cellArray) {
        _cellArray = @[@"1",@"2",@"3",@"4"];
    }
    return _cellArray;
}



@end





