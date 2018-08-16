//
//  UIView+Frame.m
//  Category_OC
//
//  Created by teamotto on 2018/8/16.
//  Copyright © 2018年 soso. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

- (void)setFrame_x:(CGFloat)frame_x
{
    CGRect frame = self.frame;
    frame.origin.x = frame_x;
    self.frame = frame;
}

- (CGFloat)frame_x
{
    return self.frame.origin.x;
}

- (void)setFrame_y:(CGFloat)frame_y
{
    CGRect frame = self.frame;
    frame.origin.y = frame_y;
    self.frame = frame;
}

- (CGFloat)frame_y
{
    return self.frame.origin.y;
}

- (void)setFrame_w:(CGFloat)frame_w
{
    CGRect frame = self.frame;
    frame.size.width = frame_w;
    self.frame = frame;
}

- (CGFloat)frame_w
{
    return self.frame.size.width;
}

- (void)setFrame_h:(CGFloat)frame_h
{
    CGRect frame = self.frame;
    frame.size.height = frame_h;
    self.frame = frame;
}

- (CGFloat)frame_h
{
    return self.frame.size.height;
}

- (void)setFrame_size:(CGSize)frame_size
{
    CGRect frame = self.frame;
    frame.size = frame_size;
    self.frame = frame;
}

- (CGSize)frame_size
{
    return self.frame.size;
}

- (void)setFrame_origin:(CGPoint)frame_origin
{
    CGRect frame = self.frame;
    frame.origin = frame_origin;
    self.frame = frame;
}

- (CGPoint)frame_origin
{
    return self.frame.origin;
}

@end
