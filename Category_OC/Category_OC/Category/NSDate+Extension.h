//
//  NSDate+UCSDate.h
//  Category_OC
//
//  Created by teamotto on 2018/8/16.
//  Copyright © 2018年 soso. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extension)

/// dateStr转格式yyyy-MM-dd HH:mm:ss
+(NSString*)formatWithStr:(NSString*)dateStr;
/// date转格式yyyy-MM-dd HH:mm:ss
+(NSString*)formatWithDate:(NSDate*)date;
/// string转Date
+(NSDate*)formatWithDateStr:(NSString*)str;
/// 年-月
+(NSString*)currentYearAndMonth;
/// 当前yyyy-MM-dd HH:mm:ss
+(NSString*)currentTime;
/// dateStr转时间格式toFrommat
+(NSString*)formatDate:(NSString*) dateStr fromFormat:(NSString*)fromFormat toFormart:(NSString*)toFrommat;
/// 时间转时间戳
+(NSInteger)integerValueWithFormDate:(NSDate *)date;
/// 两时间差的天数
+(NSInteger)numberOfDaysWithFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate;

@end
