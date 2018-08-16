//
//  UIImage+Scale.h
//  Category_OC
//
//  Created by teamotto on 2018/8/16.
//  Copyright © 2018年 soso. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Scale)
{
    
}

/** 截取部分图像 */
-(UIImage *)getSubImage:(CGRect)rect;

/** 改变尺寸 */
-(UIImage *)scaleToSize:(CGSize)size;

/** 圆形Image */
-(UIImage *)circleImage;

/** 背景色 */
+(UIImage *)imageWithColor:(UIColor *)color;

/** 根据theView 生成 Image */
+(UIImage *)imageFromView:(UIView *)theView atFrame:(CGRect)rect;

/** 降分辨率 byte：图片大小降到小于该值 单位:k*/
-(NSData *)imageWithDatabyte:(CGFloat)byte;

@end
