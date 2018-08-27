//
//  UIButton+Target.m
//  demo_oc
//
//  Created by teamotto on 2018/8/27.
//  Copyright © 2018年 soso. All rights reserved.
//

#import "UIButton+Target.h"
#import <objc/runtime.h>

static NSString *buttonBlockKey = @"Objc_BtnBlockClickKey";

#define kUIButtonExtenionSoInvocationIndex 2

@implementation UIButton (Target)

-(void)setClickBlock:(ClickBlock)clickBlock {
    objc_setAssociatedObject(self, &buttonBlockKey,clickBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
-(ClickBlock)clickBlock {
    return objc_getAssociatedObject(self, &buttonBlockKey);
}

-(void)addClickBlock:(void (^)(UIButton *))clickBlock {
    self.clickBlock = clickBlock;
    
    [self addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
}

-(void)addTarget:(nullable id)target actionValue:(NSArray *)actionValue action:(nullable SEL)action  forControlEvents:(UIControlEvents)controlEvents {
    if(target == nil) return;
    if(action == nil) return;
    __block NSInvocation *invocation = [self invocationWithSelector:action target:target actionValue:actionValue];
    [self addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    self.clickBlock = ^(UIButton *sender) {
        [invocation invoke];
    };
}
-(NSInvocation *)invocationWithSelector:(SEL)action target:(id)target actionValue:(NSArray *)actionValue{
    NSMethodSignature *sig = [[target class] instanceMethodSignatureForSelector:action];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:sig];
    [invocation setSelector:action];
    [invocation setTarget:target];
    NSArray *params = actionValue?actionValue:@[self];
    int index = kUIButtonExtenionSoInvocationIndex;
    for (id obj in params) {
        void *p = (__bridge void *)obj;
        [invocation setArgument:&p atIndex:index];
        index++;
    }
    return invocation;
}
-(void)click {
    !self.clickBlock?:self.clickBlock(self);
}


@end
