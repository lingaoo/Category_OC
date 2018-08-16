//
//  UITabBar+Badge.h
//  Category_OC
//
//  Created by teamotto on 2018/8/16.
//  Copyright © 2018年 soso. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (Badge)

- (void)showBadgeOnItemIndex:(int)index totalItems:(NSInteger)items;   //显示小红点

- (void)hideBadgeOnItemIndex:(int)index; //隐藏小红点

@end
