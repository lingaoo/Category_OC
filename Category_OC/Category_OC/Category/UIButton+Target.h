//
//  UIButton+Target.h
//  demo_oc
//
//  Created by teamotto on 2018/8/27.
//  Copyright © 2018年 soso. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ClickBlock)(UIButton *sender);

@interface UIButton (Target)
{
    
}

/**
 点击Button Block形式

 @param clickBlock Block
 */
-(void)addClickBlock:(void(^)(UIButton *sender))clickBlock;


/**
 点击Button 带多参数
 
 @param target target
 @param actionValue SEL方法参数
 @param action SEL
 @param controlEvents 点击类型值
 */
-(void)addTarget:(nullable id)target actionValue:(NSArray *)actionValue action:(nullable SEL)action  forControlEvents:(UIControlEvents)controlEvents;

@end
