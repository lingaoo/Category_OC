//
//  NSDate+UCSDate.h
//  Category_OC
//
//  Created by teamotto on 2018/8/16.
//  Copyright © 2018年 soso. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extension)

+(NSString*)formatWithStr:(NSString*)dateStr;
+(NSString*)formatWithDate:(NSDate*)date;
+(NSDate*)formatWithDateStr:(NSString*)str;
+(NSString*)currentYearAndMonth;
+(NSString*)currentTime;
+(NSString*)formatDate:(NSString*) dateStr fromFormat:(NSString*)fromFormat toFormart:(NSString*)toFrommat;

@end
