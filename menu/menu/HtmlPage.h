//
//  HtmlPage.h
//  menu
//
//  Created by xiangyutao on 15/10/3.
//  Copyright © 2015年 向宇涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HtmlPage : NSObject
@property(nonatomic,strong)NSString*html;
@property(nonatomic,strong)NSString*iconName;
@property(nonatomic,strong)NSString*title;

-(instancetype)initWithDict:(NSDictionary*)dict;
+(id)htmlPageWithDict:(NSDictionary*)dict;

@end
