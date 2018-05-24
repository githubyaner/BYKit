//
//  BYDateManager.m
//  BYKit
//
//  Created by SunShine.Rock on 16/4/26.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "BYDataManager.h"

@implementation BYDateManager
#pragma mark - 获取当前日期,如:2015-05-21
+ (NSString *)getTheCurrentDate {
    NSDateFormatter *formatter =[[NSDateFormatter alloc] init];
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [formatter setTimeZone:timeZone];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *currentTime = [formatter stringFromDate:[NSDate date]];
    return currentTime;
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
#pragma mark - 计算两段时间的时间差
+ (NSString *)twoPeriodOfStartTime:(NSString *)startTime andEndTime:(NSString *)endTime {
    NSDateFormatter *formatter1 = [[NSDateFormatter alloc] init];
    [formatter1 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *datenow = [formatter1 dateFromString:endTime];
    NSDateFormatter *formatter2 = [[NSDateFormatter alloc]init];
    [formatter2 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *newdate = [formatter2 dateFromString:startTime];
    long dd = (long)[datenow timeIntervalSince1970] - [newdate timeIntervalSince1970];
    NSString *timeString = @"";
    if (dd / 3600 < 1) {
        timeString = [NSString stringWithFormat:@"%ld", dd / 60];
        timeString = [NSString stringWithFormat:@"%@分钟", timeString];
    }
    if (dd / 3600 > 1 && dd / 86400 < 1) {
        timeString = [NSString stringWithFormat:@"%ld", dd / 3600];
        timeString = [NSString stringWithFormat:@"%@小时", timeString];
    }
    if (dd / 86400 > 1) {
        timeString = [NSString stringWithFormat:@"%ld", dd / 86400];
        timeString = [NSString stringWithFormat:@"%@天", timeString];
    }
    return timeString;
}
#pragma mark - 比较一个时间是不是在一段时间范围内
+ (BOOL)isBetweenTheStartTime:(NSString *)startTime endTime:(NSString *)endTime andCurrentTime:(NSString *)currentTime {
    if (startTime == nil || endTime == nil) {
        return NO;
    }
    NSInteger isTime1 = [startTime compare:currentTime];
    NSInteger isTime2 = [endTime compare:currentTime];
    //1为前者大于后者,-1为前者小于后者
    if (isTime1 == -1 && isTime2 == 1) {
        return YES;
    } else if (isTime1 == 0 && isTime2 == 1) {
        return YES;
    } else if (isTime1 == 0 && isTime2 == 0) {
        return YES;
    } else if (isTime1 == -1 && isTime2 == 0) {
        return YES;
    }
    //判断点击的时间与开始时间和结束时间相同的情况.三者都是同一天.
    return NO;
}



#pragma mark - 当前时间转化成毫秒(从1970年)
+ (NSString *)millisecondFromDate {
    NSTimeInterval time=[[NSDate date] timeIntervalSince1970] * 1000;
    long i = time;//NSTimeInterval返回的是double类型
    return [NSString stringWithFormat:@"%ld", i];
}
#pragma mark - date类型 ---- 毫秒(从1970年)
+ (NSString *)millisecondFromDate:(NSDate *)date {
    NSTimeInterval time=[date timeIntervalSince1970] * 1000;
    long i = time;//NSTimeInterval返回的是double类型
    return [NSString stringWithFormat:@"%ld", i];
}
#pragma mark - date的string类型 ---- 毫秒(从1970年)
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
#pragma mark - 毫秒转化成date(从1970年)
+ (NSDate *)dateFromMillisecond:(NSString *)millsec {
    NSDate *date = [[NSDate alloc]initWithTimeIntervalSince1970:[millsec longLongValue] / 1000.0];
    return date;
}




#pragma mark - 将时间转换成我想需要的时间---- 年.月.日
+ (NSString *)thePointDateConversionWithDateStr:(NSString *)dateStr {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];//@"zh_CN" @"zh_EN" @"en_US"
    //原类型
    [dateFormatter setDateFormat:@"MMM dd,yyyy HH:mm:ss a"];
    NSDate *date = [dateFormatter dateFromString:dateStr];
    //    NSLog(@"%@", date);
    //新类型
    [dateFormatter setDateFormat:@"yyyy.MM.dd"];
    NSString *newDateStr = [dateFormatter stringFromDate:date];
    //    NSLog(@"%@", newDateStr);
    return newDateStr;
}
#pragma mark - 将时间转换成我想需要的时间---- 年-月-日
+ (NSString *)theDateConversionWithDateStr:(NSString *)dateStr {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];//@"zh_CN" @"zh_EN" @"en_US"
    //原类型
    [dateFormatter setDateFormat:@"MMM dd,yyyy HH:mm:ss a"];
    NSDate *date = [dateFormatter dateFromString:dateStr];
    //    NSLog(@"%@", date);
    //新类型
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *newDateStr = [dateFormatter stringFromDate:date];
    //    NSLog(@"%@", newDateStr);
    return newDateStr;
}
#pragma mark - 将时间转换成我想需要的时间---- 年\n月-日
+ (NSString *)theNewlineDateConversionWithDateStr:(NSString *)dateStr {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];//@"zh_CN" @"zh_EN" @"en_US"
    //原类型
    [dateFormatter setDateFormat:@"MMM dd,yyyy HH:mm:ss a"];
    NSDate *date = [dateFormatter dateFromString:dateStr];
    //    NSLog(@"%@", date);
    //新类型
    [dateFormatter setDateFormat:@"yyyy\nMM-dd"];
    NSString *newDateStr = [dateFormatter stringFromDate:date];
    //    NSLog(@"%@", newDateStr);
    return newDateStr;
}
#pragma mark - 将时间转换为我想需要的时间-----月/日
+ (NSString *)theDateConversionMonthDayWithDateStr:(NSString *)dateStr {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];//@"zh_CN" @"zh_EN" @"en_US"
    //原类型
    [dateFormatter setDateFormat:@"MMM dd,yyyy HH:mm:ss a"];
    NSDate *date = [dateFormatter dateFromString:dateStr];
    //    NSLog(@"%@", date);
    //新类型
    [dateFormatter setDateFormat:@"MM/dd"];
    NSString *newDateStr = [dateFormatter stringFromDate:date];
    //    NSLog(@"%@", newDateStr);
    return newDateStr;
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




#pragma mark - 显示日期和星期
+ (NSString *)dateAndWeekFromDate:(NSString *)date {
    return [NSString stringWithFormat:@"%@\n%@", [[self class] dateFromDate:date], [[self class] weekFromDate:date]];
}
#pragma mark - 改变日期显示方式
+ (NSString *)dateFromDate:(NSString *)date {
    return [NSString stringWithFormat:@"%@/%@", [date substringWithRange:NSMakeRange(5, 2)], [date substringFromIndex:8]];
}
#pragma mark - YYYY-MM-dd转化成MM月dd日
+ (NSString *)dateOneFromDateTwo:(NSString *)date {
    return [NSString stringWithFormat:@"%@月%@日", [date substringWithRange:NSMakeRange(5, 2)], [date substringFromIndex:8]];
}
#pragma mark - 根据日期显示星期
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
#pragma mark - 判断今天是星期几
+ (NSString*)weekOfCurrentDate {
    NSArray * arrWeek=[NSArray arrayWithObjects:@"周日",@"周一",@"周二",@"周三",@"周四",@"周五",@"周六", nil];
    NSDate *date = [NSDate date];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSYearCalendarUnit |
    NSMonthCalendarUnit |
    NSDayCalendarUnit |
    NSWeekdayCalendarUnit |
    NSHourCalendarUnit |
    NSMinuteCalendarUnit |
    NSSecondCalendarUnit;
    comps = [calendar components:unitFlags fromDate:date];
    NSInteger week = [comps weekday];
    week = week - 1;
    //    NSInteger year=[comps year];
    NSInteger month = [comps month];
    NSInteger day = [comps day];
    return [NSString stringWithFormat:@"%@ %d/%d",[arrWeek objectAtIndex:week], month, day];
}


#pragma mark - 仿QQ空间时间显示
/**
 *  仿QQ空间时间显示
 *  @param string eg:2015年5月24日 02时21分30秒
 */
+ (NSString *)format:(NSString *)string {
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    [inputFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *inputDate = [inputFormatter dateFromString:string];
    //NSLog(@"startDate= %@", inputDate);
    
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setLocale:[NSLocale currentLocale]];
    [outputFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    //get date str
    NSString *str = [outputFormatter stringFromDate:inputDate];
    //str to nsdate
    NSDate *strDate = [outputFormatter dateFromString:str];
    //修正8小时的差时
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: strDate];
    NSDate *endDate = [strDate dateByAddingTimeInterval: interval];
    //NSLog(@"endDate:%@",endDate);
    NSString *lastTime = [self compareDate:endDate];
    //    NSLog(@"lastTime = %@",lastTime);
    return lastTime;
}
+ (NSString *)compareDate:(NSDate *)date {
    NSTimeInterval secondsPerDay = 24 * 60 * 60;
    //修正8小时之差
    NSDate *date1 = [NSDate date];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: date1];
    NSDate *localeDate = [date1  dateByAddingTimeInterval: interval];
    
    //NSLog(@"nowdate=%@\nolddate = %@",localeDate,date);
    NSDate *today = localeDate;
    NSDate *yesterday, *beforeOfYesterday;
    //今年
    NSString *toYears;
    
    toYears = [[today description] substringToIndex:4];
    
    yesterday = [today dateByAddingTimeInterval: -secondsPerDay];
    beforeOfYesterday = [yesterday dateByAddingTimeInterval: -secondsPerDay];
    
    // 10 first characters of description is the calendar date:
    NSString *todayString = [[today description] substringToIndex:10];
    NSString *yesterdayString = [[yesterday description] substringToIndex:10];
    NSString *beforeOfYesterdayString = [[beforeOfYesterday description] substringToIndex:10];
    
    NSString *dateString = [[date description] substringToIndex:10];
    NSString *dateYears = [[date description] substringToIndex:4];
    
    NSString *dateContent;
    if ([dateYears isEqualToString:toYears]) {//同一年
        //今 昨 前天的时间
        NSString *time = [[date description] substringWithRange:(NSRange){11, 5}];
        //其他时间
        NSString *time2 = [[date description] substringWithRange:(NSRange){5, 11}];
        if ([dateString isEqualToString:todayString]) {
            dateContent = [NSString stringWithFormat:@"今天 %@", time];
            return dateContent;
        } else if ([dateString isEqualToString:yesterdayString]) {
            dateContent = [NSString stringWithFormat:@"昨天 %@", time];
            return dateContent;
        } else if ([dateString isEqualToString:beforeOfYesterdayString]) {
            dateContent = [NSString stringWithFormat:@"前天 %@", time];
            return dateContent;
        } else {
            return time2;
        }
    } else {
        return dateString;
    }
}
@end
