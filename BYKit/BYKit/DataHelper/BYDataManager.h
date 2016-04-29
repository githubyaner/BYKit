//
//  BYDataManager.h
//  BYKit
//
//  Created by SunShine.Rock on 16/4/26.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BYDataManager : NSObject
//显示日期和星期
+ (NSString *)dateAndWeekFromDate:(NSString *)date;
//YYYY-MM-dd转化成MM/dd
+ (NSString *)dateFromDate:(NSString *)date;
//YYYY-MM-dd转化成MM月dd日
+ (NSString *)dateOneFromDateTwo:(NSString *)date;
//根据日期显示星期
+ (NSString *)weekFromDate:(NSString *)date;
//将时间转换成我想需要的时间---- 年-月-日 时：分：秒
+ (NSString *)theDateConversionWithDateStr:(NSString *)dateStr;

#pragma mark - 获取当前时间,如:2015-05-21 05:21:21
+ (NSString *)getTheCurrentTime;
#pragma mark - 转换成日期,如:2015-05-21 05:21:21-->2015-05-21
+ (NSString *)convertedToDate:(NSString *)dateStr;
#pragma mark - 比较两个时间的大小
+ (NSComparisonResult)compareOneDay:(NSDate *)oneDate withAnotherDay:(NSDate *)currentDate;

//当前时间转化成毫秒(从1970年)
+ (NSString *)millisecondFromDate;
//date类型 ---- 毫秒(从1970年)
+ (NSString *)millisecondFromDate:(NSDate *)date;
//date的string类型 ---- 毫秒(从1970年)
+ (NSString *)millisecondFromDateString:(NSString *)dateStr;
//毫秒转化成date(从1970年)
+ (NSDate *)dateFromMillisecond:(NSString *)millsec;
@end
