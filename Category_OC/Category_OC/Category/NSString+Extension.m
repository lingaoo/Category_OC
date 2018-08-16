//
//  NSString+Extension.m
//  Category_OC
//
//  Created by teamotto on 2018/8/16.
//  Copyright © 2018年 soso. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)


#pragma mark- 格式验证

+(BOOL)isEmpty:(NSString *)string {
    if ( ![string isKindOfClass:[NSString class]] ||  !string || string==nil ||[string isKindOfClass:[NSNull class]]||string==NULL||[string isEqualToString:@"(null)"] || [string isEqualToString:@""] || string.length <= 0 || !(string.length > 0)) {
        return YES;
    } else {
        NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        NSString *trimedString = [string stringByTrimmingCharactersInSet:set];
        if ([trimedString length] == 0 || !([trimedString length] >0)) {
            return YES;
        } else {
            return NO;
        }
    }
}

-(BOOL)hasValue {
    return ![NSString isEmpty:self];
}

- (BOOL)isValidateEmail
{
    if(self.hasValue == NO) return NO;

    NSString *emailCheck = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",emailCheck];
    return [emailTest evaluateWithObject:self];
}

- (BOOL)isMobileNumber
{
    if(self.hasValue == NO) return NO;

    NSString *temp = self;
    NSString *regex = @"^[0-9]{11}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:temp];
    return isMatch;
}

- (BOOL)isValidatePassword {
    if(self.hasValue == NO) return NO;
    NSString *regstr = @"^[A-Za-z0-9]{6,16}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regstr];
    BOOL isMatch = [predicate evaluateWithObject:self];
    return isMatch;
}

/// 正则匹配用户身份证号15或18位
- (BOOL)isValidateUserIdCard
{
    if(self.hasValue == NO) return NO;

    NSString *pattern = @"(^[0-9]{15}$)|([0-9]{17}([0-9]|X)$)";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
}

/// 正则匹配用户姓名,20位的中文或英文
- (BOOL)isValidateUserName
{
    if(self.hasValue == NO) return NO;

    NSString *pattern = @"^[a-zA-Z\u4E00-\u9FA5]{1,20}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
    
}
/// 正则匹配用户密码6-18位 数字和字母组合
- (BOOL)isValidatePassword2
{
    if(self.hasValue == NO) return NO;

    NSString *pattern = @"^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{6,18}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
}
/// 正则匹配用户密码6-18位 （数字、字母、符号至少两种）正则表达式
- (BOOL)isValidatePassword3
{
    if(self.hasValue == NO) return NO;
    
    NSString *pattern = @"^(?=.*[a-zA-Z0-9].*)(?=.*[a-zA-Z\\W].*)(?=.*[0-9\\W].*).{6,18}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
}

@end
