//
//  menuTableViewController.m
//  menu
//
//  Created by xiangyutao on 15/10/2.
//  Copyright © 2015年 向宇涛. All rights reserved.
//

#import "menuTableViewController.h"
#import "baseScrollView.h"
#import "Items.h"
#import "webViewController.h"
#import "MapViewController.h"

#define page 5

@interface menuTableViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong)UISearchBar*searchBar;
@property(nonatomic,strong)UIScrollView*PicScrollView;
@property(nonatomic,strong)UISegmentedControl*segmentedControl;
@property(nonatomic,strong)NSArray*iconNameArray;
@property(nonatomic,strong)NSMutableArray*cellData;
@property(nonatomic,strong)NSArray*htmls;






@end

@implementation menuTableViewController

-(UIScrollView *)PicScrollView{
    if (_PicScrollView==nil) {
        CGRect frame=CGRectMake(20, 10, self.view.bounds.size.width-40, 80);
     _PicScrollView=[baseScrollView scrollerVieWithFrame:frame andPage:page];
        _PicScrollView.pagingEnabled=YES;
        
    }return _PicScrollView;
}

-(UISearchBar *)searchBar{
    if (_searchBar==nil) {
       _searchBar=[[UISearchBar alloc]init];
        _searchBar.frame=CGRectMake(20, 10, self.view.bounds.size.width-40, 24);
        _searchBar.backgroundColor=[UIColor redColor];
        [self.navigationController.navigationBar addSubview:_searchBar];
        

    }return _searchBar;
}

-(UISegmentedControl *)segmentedControl{
    if (_segmentedControl==nil) {
        NSArray*arrary=@[@"一点最热榜",@"一点价值榜",@"一点争议榜"];
        _segmentedControl=[[UISegmentedControl alloc]initWithItems:arrary];
    }return _segmentedControl;
}


-(NSArray *)iconNameArray{
    if (_iconNameArray==nil) {
        _iconNameArray=@[@"28072216",@"28072216",@"28072216",@"28072216",@"28072216"];
    }return _iconNameArray;
}

-(NSMutableArray *)cellData{
    if (_cellData==nil) {
        _cellData=[NSMutableArray array];
    }return _cellData;
}

//-(NSArray *)htmls{
//    if (_htmls==nil) {
//#warning 1.暂时未获取json文件
//        NSString*filePath=[[NSBundle mainBundle]pathForResource:@"XXX.json" ofType:nil];
//        //2.将json转化为NSData
//        NSData*data=[NSData dataWithContentsOfFile:filePath];
//      NSArray*hostSpotArray=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
//        //遍历数组里的字典，转化成模型
//        NSMutableArray*htmlsM=[NSMutableArray array];
//        for (NSDictionary*dic in hostSpotArray) {
//            <#statements#>
//        }
//        
//    }
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableHeaderView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 150)];
    self.tableView.tableHeaderView.backgroundColor=[UIColor redColor];
       [self.tableView.tableHeaderView addSubview:self.PicScrollView];
    self.PicScrollView.delegate=self;
    for (int i=0; i<self.iconNameArray.count; i++) {
        UIImage*image=[UIImage imageNamed:self.iconNameArray[i]];
        UIImageView*imageView=[[UIImageView alloc]initWithImage:image];
        imageView.frame=CGRectMake(i*self.PicScrollView.frame.size.width, 0, self.PicScrollView.frame.size.width, self.PicScrollView.frame.size.height);
        [_PicScrollView addSubview:imageView];
    }
    
    UIPageControl*pageControl=[UIPageControl new];
    pageControl.numberOfPages=page;
    pageControl.currentPageIndicatorTintColor=[UIColor colorWithRed:255/255.0f green:244/255.0f blue:227/255.0f alpha:1];
    pageControl.pageIndicatorTintColor=[UIColor colorWithRed:67/255.0f green:174/255.0f blue:168/255.0f alpha:1];
    pageControl.center=_PicScrollView.center;
    [self.tableView.tableHeaderView addSubview:pageControl];
    pageControl.tag=1000;

    self.segmentedControl.frame=CGRectMake(20, self.PicScrollView.bounds.size.height+30, self.PicScrollView.bounds.size.width, 20);
    [self.tableView.tableHeaderView addSubview:self.segmentedControl];
    
    
    Items*item1=[Items itemWithIconName:nil andDetailInfo:@"我是怎么年薪上万的" andVcClass:[webViewController class]];
    
     Items*item2=[Items itemWithIconName:nil andDetailInfo:@"合理膳食的必要性" andVcClass:[webViewController class]];
   
     Items*item3=[Items itemWithIconName:nil andDetailInfo:@"冬天应该怎么吃" andVcClass:[webViewController class]];
    Items*item4=[Items itemWithIconName:nil andDetailInfo:@"家常菜推荐" andVcClass:[webViewController class]];
     Items*item5=[Items itemWithIconName:nil andDetailInfo:@"天气转凉应该吃什么" andVcClass:[webViewController class]];
    NSArray*group1=@[item1,item2,item3,item4,item5];
    [self.cellData addObject:group1];
    
    
    
    
    Items*item6=[Items itemWithIconName:nil andDetailInfo:@"早餐" andSubtitle:@"20.3万"];
    Items*item7=[Items itemWithIconName:nil andDetailInfo:@"午餐" andSubtitle:@"18.3万"];
    Items*item8=[Items itemWithIconName:nil andDetailInfo:@"乌冬面" andSubtitle:@"31.3万"];
    Items*item9=[Items itemWithIconName:nil andDetailInfo:@"私房菜" andSubtitle:@"52.1万"];
    Items*item10=[Items itemWithIconName:nil andDetailInfo:@"湘菜" andSubtitle:@"113.3万"];
    Items*item11=[Items itemWithIconName:nil andDetailInfo:@"粤菜" andSubtitle:@"56.3万"];
    NSArray*group2=@[item6,item7,item8,item9,item10,item11];
    [self.cellData addObject:group2];
    NSLog(@"celldata数组中元素的个数%luud(unsigned long)",self.cellData.count);
    
    
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"定位" style:UIBarButtonItemStyleDone target:self action:@selector(locateYouLocation)];

    
}
-(void)locateYouLocation{
    MapViewController*MVC=[MapViewController new];
    MVC.hidesBottomBarWhenPushed=YES;
    MVC.navigationController.toolbarHidden=YES;
    [self.navigationController pushViewController:MVC animated:YES];
}





#pragma mark---scrollView delegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat pageWith = self.PicScrollView.frame.size.width;
    NSInteger index =self.PicScrollView.contentOffset.x/pageWith;
    UIPageControl*pageControl=(UIPageControl*)[self.view viewWithTag:1000];
   pageControl.currentPage =index;
    
}





#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return self.cellData.count;
    }

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    
        NSArray*group=self.cellData[section];
        return group.count;
    
    }


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section==0) {
        static NSString*ID=@"cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID ];
        if (cell==nil) {
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
    NSArray*group=self.cellData[indexPath.section];
        Items*item=group[indexPath.row];
        cell.textLabel.text=item.detailInfo;
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
    else{
        static NSString*ID=@"cell";
        UITableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:ID];
        if (cell==nil) {
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
            
        }
        NSArray*group=self.cellData[1];
        Items*item=group[indexPath.row];

        cell.detailTextLabel.text=item.subtitleInfo;
        cell.textLabel.text=item.detailInfo;

        return cell;
    }
  
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray*group=self.cellData[indexPath.section];
    Items*items=group[indexPath.row];
    if (items.vcClass!=nil) {
        id vc=[items.vcClass new];
        [self.navigationController pushViewController:vc animated:YES];
    }
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
