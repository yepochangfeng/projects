//
//  webViewController.m
//  menu
//
//  Created by xiangyutao on 15/10/3.
//  Copyright © 2015年 向宇涛. All rights reserved.
//

#import "webViewController.h"

@interface webViewController ()

@property(nonatomic,strong)UIWebView*webView;

@end

@implementation webViewController


- (void)viewDidLoad {
  [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self.navigationController setToolbarHidden:YES];
    self.title=@"新闻头条";
    self.view.backgroundColor=[UIColor blueColor];
   self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(btnClick)];
   NSString*urlStr=@"https://www.baidu.com";
    NSURL*url=[NSURL URLWithString:urlStr];
    NSURLRequest*request=[NSURLRequest requestWithURL:url];
    self.webView=[[UIWebView alloc]init];
    self.webView.frame=[UIScreen mainScreen].bounds;
    self.webView.backgroundColor=[UIColor greenColor];
    
    [self.view addSubview:self.webView];
    [self.webView loadRequest:request];
    
}

-(void)btnClick{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
