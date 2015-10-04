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
@interface ListViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>

#define screenWidth [UIScreen mainScreen].bounds.size.width
#define screenHeight [UIScreen mainScreen].bounds.size.height

@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *categoryCollectView;
@property (weak, nonatomic) IBOutlet UIScrollView *detailScrollView;
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
   
    self.detailScrollView.contentSize = CGSizeMake(screenWidth * 4, screenHeight - 104);
    self.detailScrollView.delaysContentTouches = NO;
    self.detailScrollView.canCancelContentTouches = YES;
    for (int i = 0; i < 4; i++) {
        UITableView *detailTableView = [[UITableView alloc]initWithFrame:CGRectMake(i * screenWidth, 0, screenWidth, screenHeight - 104) style:UITableViewStylePlain];
        detailTableView.delegate = self;
        detailTableView.dataSource = self;
        [self.detailScrollView addSubview:detailTableView];
    }

}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if ([scrollView isKindOfClass:[UITableView class]]) {
        NSLog(@"----列表------");
        self.detailScrollView.scrollEnabled = NO;
    }else
    {
        NSLog(@"-----滚动视图-----");
        self.detailScrollView.scrollEnabled = YES;
    }
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
    return 9;
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
