//
//  BYDataManager.m
//  BYKit
//
//  Created by SunShine.Rock on 16/4/26.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "BYDataManager.h"

@implementation BYDataManager
//显示日期和星期
+ (NSString *)dateAndWeekFromDate:(NSString *)date {
    return [NSString stringWithFormat:@"%@\n%@", [[self class] dateFromDate:date], [[self class] weekFromDate:date]];
}
//改变日期显示方式
+ (NSString *)dateFromDate:(NSString *)date {
    return [NSString stringWithFormat:@"%@/%@", [date substringWithRange:NSMakeRange(5, 2)], [date substringFromIndex:8]];
}
//YYYY-MM-dd转化成MM月dd日
+ (NSString *)dateOneFromDateTwo:(NSString *)date {
    return [NSString stringWithFormat:@"%@月%@日", [date substringWithRange:NSMakeRange(5, 2)], [date substringFromIndex:8]];
}
//根据日期显示星期
+ (NSString *)weekFromDate:(NSString *)date {
    NSInteger year = [[date substringToIndex:3] integerValue];
    NSInteger month = [[date substringWithRange:NSMakeRange(5, 2)] integerValue];
    NSInteger day = [[date substringFromIndex:8] integerValue];
    NSDateComponents *_comps = [[NSDateComponents alloc] init];
    [_comps setDay:day];
    [_comps setMonth:month];
    [_comps setYear:year];
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *_date = [gregorian dateFromComponents:_comps];
    NSDateComponents *weekdayComponents =
    [gregorian components:NSWeekdayCalendarUnit fromDate:_date];
    NSInteger _weekday = [weekdayComponents weekday];
    switch (_weekday - 1) {
        case 0:
            return @"周日";
            break;
        case 1:
            return @"周一";
            break;
        case 2:
            return @"周二";
            break;
        case 3:
            return @"周三";
            break;
        case 4:
            return @"周四";
            break;
        case 5:
            return @"周五";
            break;
        case 6:
            return @"周六";
            break;
        default:
            return nil;
            break;
    }
}
//将时间转换成我想需要的时间---- 年-月-日 时：分：秒
+ (NSString *)theDateConversionWithDateStr:(NSString *)dateStr {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];//@"zh_CN" @"zh_EN" @"en_US"
    //原类型
    [dateFormatter setDateFormat:@"MMM dd,yyyy HH:mm:ss a"];
    NSDate *date = [dateFormatter dateFromString:dateStr];
    //    NSLog(@"%@", date);
    //新类型
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *newDateStr = [dateFormatter stringFromDate:date];
    //    NSLog(@"%@", newDateStr);
    return newDateStr;
}


#pragma mark - 获取当前时间,如:2015-05-21 05:21:21
+ (NSString *)getTheCurrentTime {
    NSDateFormatter *formatter =[[NSDateFormatter alloc] init];
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [formatter setTimeZone:timeZone];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *currentTime = [formatter stringFromDate:[NSDate date]];
    return currentTime;
}

#pragma mark - 转换成日期,如:2015-05-21 05:21:21-->2015-05-21
+ (NSString *)convertedToDate:(NSString *)dateStr {
    NSDateFormatter *inputFormatter= [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate*inputDate = [inputFormatter dateFromString:dateStr];
    
    NSDateFormatter *outputFormatter= [[NSDateFormatter alloc] init];
    [outputFormatter setDateFormat:@"yyyy-MM-dd"];
    
    NSString *str= [outputFormatter stringFromDate:inputDate];
    return str;
}
#pragma mark - 比较两个时间的大小
+ (NSComparisonResult)compareOneDay:(NSDate *)oneDate withAnotherDay:(NSDate *)currentDate {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *oneDayStr = [dateFormatter stringFromDate:oneDate];
    NSString *anotherDayStr = [dateFormatter stringFromDate:currentDate];
    NSDate *dateA = [dateFormatter dateFromString:oneDayStr];
    NSDate *dateB = [dateFormatter dateFromString:anotherDayStr];
    NSComparisonResult result = [dateA compare:dateB];
    NSLog(@"date1 : %@, date2 : %@", oneDate, currentDate);
    //1<2 NSOrderedAscending  1=2 NSOrderedSame 1>2 NSOrderedDescending
    return result;
}



//当前时间转化成毫秒(从1970年)
+ (NSString *)millisecondFromDate {
    NSTimeInterval time=[[NSDate date] timeIntervalSince1970] * 1000;
    long i = time;//NSTimeInterval返回的是double类型
    return [NSString stringWithFormat:@"%ld", i];
}
//date类型 ---- 毫秒(从1970年)
+ (NSString *)millisecondFromDate:(NSDate *)date {
    NSTimeInterval time=[date timeIntervalSince1970] * 1000;
    long i = time;//NSTimeInterval返回的是double类型
    return [NSString stringWithFormat:@"%ld", i];
}
//date的string类型 ---- 毫秒(从1970年)
+ (NSString *)millisecondFromDateString:(NSString *)dateStr {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];//@"zh_CN" @"zh_EN" @"en_US"
    //原类型
    [dateFormatter setDateFormat:@"MMM dd,yyyy HH:mm:ss a"];
    NSDate *date = [dateFormatter dateFromString:dateStr];
    NSTimeInterval time=[date timeIntervalSince1970] * 1000;
    long i = time;//NSTimeInterval返回的是double类型
    return [NSString stringWithFormat:@"%ld", i];
}
//毫秒转化成date(从1970年)
+ (NSDate *)dateFromMillisecond:(NSString *)millsec {
    NSDate *date = [[NSDate alloc]initWithTimeIntervalSince1970:[millsec longLongValue] / 1000.0];
    return date;
}
@end
