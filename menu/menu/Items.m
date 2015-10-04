
//
//  Items.m
//  menu
//
//  Created by xiangyutao on 15/10/3.
//  Copyright © 2015年 向宇涛. All rights reserved.
//

#import "Items.h"

@implementation Items
-(id)initWithIconName:(NSString *)iconName andDetailInfo:(NSString *)detailInfo{
    if (self=[super init]) {
        _iconName=iconName;
        _detailInfo=detailInfo;
    }return self;
    
}


+(id)itemWithIconName:(NSString *)iconName andDetailInfo:(NSString *)detailInfo{
   return  [[self alloc]initWithIconName:iconName andDetailInfo:detailInfo];
}

+(id)itemWithIconName:(NSString *)iconName andDetailInfo:(NSString *)detailInfo andVcClass:(Class)vcClass{
    Items*item=[Items itemWithIconName:iconName andDetailInfo:detailInfo];
    item.vcClass=vcClass;
    return item;
}

+(id)itemWithIconName:(NSString *)iconName andDetailInfo:(NSString *)detailInfo andSubtitle:(NSString *)subtitleInfo{
    Items*item=[Items itemWithIconName:iconName andDetailInfo:detailInfo];
    item.subtitleInfo=subtitleInfo;
    return item;
}

@end
