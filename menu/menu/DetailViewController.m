//
//  DetailViewController.m
//  menu
//
//  Created by 王健 on 15/10/3.
//  Copyright © 2015年 向宇涛. All rights reserved.
//

#import "DetailViewController.h"
#import <WebKit/WebKit.h>
@interface DetailViewController ()
@property(nonatomic, strong)WKWebView *detailView;
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.detailView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64)];
    NSString *urlStr = @"http://www.baidu.com/";
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.detailView loadRequest:request];
    self.detailView.allowsLinkPreview = NO;
    [self.view addSubview:_detailView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
- (IBAction)goBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
