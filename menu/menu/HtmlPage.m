//
//  HtmlPage.m
//  menu
//
//  Created by xiangyutao on 15/10/3.
//  Copyright © 2015年 向宇涛. All rights reserved.
//

#import "HtmlPage.h"

@implementation HtmlPage
-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self=[super init]) {
    [self setValuesForKeysWithDictionary:dict];
    }return self;
}

+(id)htmlPageWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}
@end
