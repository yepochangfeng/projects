//
//  ListViewController.m
//  menu
//
//  Created by 王健 on 15/10/3.
//  Copyright © 2015年 向宇涛. All rights reserved.
//

#import "ListViewController.h"
#import "picCell.h"
#import "DetailCell.h"
#import "DetailViewController.h"
@interface ListViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *categoryCollectView;

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    self.categoryCollectView.backgroundColor = [UIColor whiteColor];
    self.categoryCollectView.showsHorizontalScrollIndicator = NO;
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(40, 40);
    flowLayout.minimumInteritemSpacing = 10;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.categoryCollectView.collectionViewLayout = flowLayout;
    [self.categoryCollectView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
    [self.categoryCollectView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    [self.categoryCollectView registerClass:[UICollectionElementKindSectionFooter class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer"];
   
    NSLog(@"contentsize=%f",self.categoryCollectView.contentSize.width);
}
#pragma -mark collectionView代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row % 3 == 0) {
        return 90;
    }else
    {
        return 100;
    }
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UICollectionViewCell alloc]init];
    }
    cell.backgroundColor = [UIColor brownColor];
    return cell;
}
#pragma -mark tableView代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row % 3 == 0) {
        picCell *picCell = [tableView dequeueReusableCellWithIdentifier:@"picCell"];
        if (picCell == nil) {
            picCell = [[[NSBundle mainBundle]loadNibNamed:@"picCell" owner:nil options:nil]firstObject];
        }
        return picCell;
    }else
    {
        DetailCell *detailCell = [tableView dequeueReusableCellWithIdentifier:@"detailCell"];
        if (detailCell == nil) {
            detailCell = [[[NSBundle mainBundle]loadNibNamed:@"DetailCell" owner:nil options:nil]firstObject];
        }
        return detailCell;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *detailVC = [[DetailViewController alloc]init];
    [self.navigationController pushViewController:detailVC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
