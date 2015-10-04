//
//  baseScrollView.m
//  menu
//
//  Created by xiangyutao on 15/10/2.
//  Copyright © 2015年 向宇涛. All rights reserved.
//

#import "baseScrollView.h"

@implementation baseScrollView

-(instancetype)initWithFrame:(CGRect)frame andPage:(NSInteger)page{
    if (self=[super initWithFrame:frame ]) {
        self.contentSize=CGSizeMake(page *self.frame.size.width, 0);
        self.backgroundColor=[UIColor grayColor];
       
        
        
    }return self;
}

+(id)scrollerVieWithFrame:(CGRect)frame andPage:(NSInteger)page{
    return [[self alloc]initWithFrame:frame andPage:page];
}




@end
