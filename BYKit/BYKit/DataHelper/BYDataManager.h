//
//  BYDataManager.h
//  BYKit
//
//  Created by SunShine.Rock on 16/4/26.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BYDataManager : NSObject
/*
 *  获取当前日期,如:2015-05-21
 */
+ (NSString *)getTheCurrentDate;
/*
 *  获取当前时间,如:2015-05-21 05:21:21
 */
+ (NSString *)getTheCurrentTime;



/*
 *  比较两个时间的大小
 */
+ (NSComparisonResult)compareOneDay:(NSDate *)oneDate withAnotherDay:(NSDate *)currentDate;
/*
 *  计算两段时间的时间差
 */
+ (NSString *)twoPeriodOfStartTime:(NSString *)startTime andEndTime:(NSString *)endTime;
/*
 *  比较一个时间是不是在一段时间范围内
 */
+ (BOOL)isBetweenTheStartTime:(NSString *)startTime endTime:(NSString *)endTime andCurrentTime:(NSString *)currentTime;



/*
 *  当前时间转化成毫秒(从1970年)
 */
+ (NSString *)millisecondFromDate;
/*
 *  date类型 ---- 毫秒(从1970年)
 */
+ (NSString *)millisecondFromDate:(NSDate *)date;
/*
 *  date的string类型 ---- 毫秒(从1970年)
 */
+ (NSString *)millisecondFromDateString:(NSString *)dateStr;
/*
 *  毫秒转化成date(从1970年)
 */
+ (NSDate *)dateFromMillisecond:(NSString *)millsec;



/*
 *  将时间转换成我想需要的时间---- 年\n月-日
 */
+ (NSString *)theNewlineDateConversionWithDateStr:(NSString *)dateStr;
/*
 *  将时间转换成我想需要的时间---- 年.月.日
 */
+ (NSString *)thePointDateConversionWithDateStr:(NSString *)dateStr;
/*
 *  将时间转换成我想需要的时间----- 年-月-日
 */
+ (NSString *)theDateConversionWithDateStr:(NSString *)dateStr;
/*
 *  将时间转换为我想需要的时间-----月/日
 */
+ (NSString *)theDateConversionMonthDayWithDateStr:(NSString *)dateStr;
/*
 *  转换成日期,如:2015-05-21 05:21:21-->2015-05-21
 */
+ (NSString *)convertedToDate:(NSString *)dateStr;



/*
 *  显示日期和星期
 */
+ (NSString *)dateAndWeekFromDate:(NSString *)date;
/*
 *  YYYY-MM-dd转化成MM/dd
 */
+ (NSString *)dateFromDate:(NSString *)date;
/*
 *  YYYY-MM-dd转化成MM月dd日
 */
+ (NSString *)dateOneFromDateTwo:(NSString *)date;
/*
 *  根据日期显示星期
 */
+ (NSString *)weekFromDate:(NSString *)date;
/*
 *  判断今天是星期几
 */
+ (NSString*)weekOfCurrentDate;



/**
 *  仿QQ空间时间显示
 *  @param string eg:2015年5月24日 02时21分30秒
 */
+ (NSString *)format:(NSString *)string;
@end
