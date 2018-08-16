//
//  NSDate+UCSDate.m
//  Category_OC
//
//  Created by teamotto on 2018/8/16.
//  Copyright © 2018年 soso. All rights reserved.
//

#import "NSDate+Extension.h"

@implementation NSDate (Extension)

+(NSDateFormatter*)formatter{
    static dispatch_once_t pred;
	static NSDateFormatter *sharedInstance = nil;
	dispatch_once(&pred, ^{
        sharedInstance = [[NSDateFormatter alloc] init];
    });
	return sharedInstance;

}

+(NSString*)formatWithStr:(NSString*)dateStr{
   return [NSDate formatWithDate:[NSDate formatWithDateStr:dateStr]];
}

+(NSString *)currentYearAndMonth{
    [[NSDate formatter] setDateFormat:@"yyyy-MM"];
    NSString *str = [[NSDate formatter] stringFromDate:[NSDate date]];
    return str;
}
+(NSString *)currentTime{
    [[NSDate formatter] setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *str = [[NSDate formatter] stringFromDate:[NSDate date]];
    return str;
}

+(NSString*)formatWithDate:(NSDate*)date{
    [[NSDate formatter] setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *str = [[NSDate formatter] stringFromDate:date];
    return str;
}

+(NSDate*)formatWithDateStr:(NSString*)str{
    [[NSDate formatter] setDateFormat:@"MM-dd-yyyy HH:mm:ss"];
    NSDate *date = [[NSDate formatter] dateFromString:str];
    return date;
}

+(NSString*)formatDate:(NSString*) dateStr fromFormat:(NSString*)fromFormat toFormart:(NSString*)toFrommat{
    [[NSDate formatter] setDateFormat:fromFormat];
    NSDate *date = [[NSDate formatter] dateFromString:dateStr];
    [[NSDate formatter] setDateFormat:toFrommat];
    NSString *str = [[NSDate formatter] stringFromDate:date];
    return str;
}

+(NSInteger)integerValueWithFormDate:(NSDate *)date {
    return [date timeIntervalSince1970];
}

+(NSInteger)numberOfDaysWithFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comp = [calendar components:NSCalendarUnitDay fromDate:fromDate toDate:toDate options:NSCalendarWrapComponents];
    return comp.day;
}

@end
