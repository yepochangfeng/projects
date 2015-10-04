//
//  DataHander.m
//  menu
//
//  Created by 王健 on 15/10/2.
//  Copyright © 2015年 向宇涛. All rights reserved.
//

#import "DataHander.h"

@interface DataHander ()
- (void)openDataBase;
- (void)closeDataBase;
@end

@implementation DataHander
+ (DataHander *)shareInstance
{
    static DataHander *data=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        data = [[DataHander alloc]init];
    });
    return data;
}
- (void)openDataBase
{
    NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    NSString *dataPath = [filePath stringByAppendingPathComponent:@"userInfo.sqlite3"];
    if (sqlite3_open([dataPath UTF8String], &(_dataBase)) == SQLITE_OK) {
        NSLog(@"数据库打开成功!");
    }else
    {
        NSLog(@"数据库打开失败!");
    }
}
- (void)closeDataBase
{
    if (sqlite3_close(_dataBase) == SQLITE_OK) {
        NSLog(@"数据库关闭成功!");
    }else
    {
        NSLog(@"数据库关闭失败!");
    }
}
- (void)createTable
{
    [self openDataBase];
    NSString *sql = [NSString stringWithFormat:@"create if not exists table()"];
    
}
@end
