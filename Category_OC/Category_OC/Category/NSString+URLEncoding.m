//
//  NSString+URLEncoding.m
//  EWallet
//
//  Created by Huaps‘Mac on 14-8-13.
//  Copyright (c) 2014年 ucsmy. All rights reserved.
//

#import "NSString+URLEncoding.h"

@implementation NSString(OAURLEncodingAdditions)

- (NSString *)URLEncodedString
{
    NSString*result = (NSString*)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                                           (CFStringRef)self,
                                                                                           NULL,
                                                                                           CFSTR("!*'();:@&=+$,/?%#[]"),
                                                                                           kCFStringEncodingUTF8));
//    [result autorelease];
    return result;
}
- (NSString*)URLDecodedString
{
    NSString*result = (NSString*)CFBridgingRelease(CFURLCreateStringByReplacingPercentEscapesUsingEncoding(kCFAllocatorDefault,
                                                                                                           (CFStringRef)self,
                                                                                                           CFSTR(""),
                                                                                                           kCFStringEncodingUTF8));
//    [result autorelease];
    return result;
}

@end
