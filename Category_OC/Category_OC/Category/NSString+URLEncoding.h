//
//  NSString+URLEncoding.h
//  EWallet
//
//  Created by Huaps‘Mac on 14-8-13.
//  Copyright (c) 2014年 ucsmy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString(OAURLEncodingAdditions)
- (NSString *)URLEncodedString;
- (NSString *)URLDecodedString;
@end
