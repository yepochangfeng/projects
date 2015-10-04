//
//  DataHander.h
//  menu
//
//  Created by 王健 on 15/10/2.
//  Copyright © 2015年 向宇涛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
@interface DataHander : NSObject
{
    sqlite3 *_dataBase;
}
+ (DataHander *)shareInstance;
@end
