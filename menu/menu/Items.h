//
//  Items.h
//  menu
//
//  Created by xiangyutao on 15/10/3.
//  Copyright © 2015年 向宇涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Items : NSObject
@property(nonatomic,strong)NSString*iconName;
@property(nonatomic,strong)NSString*detailInfo;
@property(nonatomic,assign)Class vcClass;
@property(nonatomic,strong)NSString*subtitleInfo;



-(id)initWithIconName:(NSString*)iconName andDetailInfo:(NSString*)detailInfo;
+(id)itemWithIconName:(NSString*)iconName andDetailInfo:(NSString*)detailInfo;
+(id)itemWithIconName:(NSString*)iconName andDetailInfo:(NSString*)detailInfo andVcClass:(Class)vcClass;

+(id)itemWithIconName:(NSString*)iconName andDetailInfo:(NSString*)detailInfo andSubtitle:(NSString*)subtitleInfo;

@end
