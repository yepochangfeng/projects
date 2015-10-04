//
//  baseScrollView.h
//  menu
//
//  Created by xiangyutao on 15/10/2.
//  Copyright © 2015年 向宇涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface baseScrollView : UIScrollView

-(id)initWithFrame:(CGRect)frame andPage:(NSInteger)page;

+(id)scrollerVieWithFrame:(CGRect)frame andPage:(NSInteger)page;

@end
