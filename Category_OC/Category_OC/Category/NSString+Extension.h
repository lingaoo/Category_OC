//
//  NSString+Extension.h
//  Category_OC
//
//  Created by teamotto on 2018/8/16.
//  Copyright © 2018年 soso. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)

#pragma mark- 格式验证

/**
 字符是否不为空
 
 @return 不为空YES
 */

-(BOOL)hasValue;

/**
 邮箱格式
 
 @return 正确YES
 */
- (BOOL)isValidateEmail;

/**
 11位手机号码
 
 @return 正确YES
 */
- (BOOL)isMobileNumber;

/**
 6-18位
 
 @return 正确YES
 */
- (BOOL)isValidatePassword;

/**
 身份证
 
 @return 正确YES
 */
- (BOOL)isValidateUserIdCard;


@end
