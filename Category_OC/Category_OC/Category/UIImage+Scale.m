//
//  UIImage+Scale.m
//  Category_OC
//
//  Created by teamotto on 2018/8/16.
//  Copyright © 2018年 soso. All rights reserved.
//

#import "UIImage+Scale.h"

@implementation UIImage (Scale)

//截取部分图像
-(UIImage*)getSubImage:(CGRect)rect
{
    CGImageRef subImageRef = CGImageCreateWithImageInRect(self.CGImage, rect);
    CGRect smallBounds = CGRectMake(0, 0, CGImageGetWidth(subImageRef), CGImageGetHeight(subImageRef));
    UIGraphicsBeginImageContext(smallBounds.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, smallBounds, subImageRef);
    UIImage* smallImage = [UIImage imageWithCGImage:subImageRef];
    UIGraphicsEndImageContext();
	
    return smallImage;
}

//等比例缩放
-(UIImage*)scaleToSize:(CGSize)size
{
    CGFloat width = CGImageGetWidth(self.CGImage);
    CGFloat height = CGImageGetHeight(self.CGImage);
	
    float radio = size.width*1.0/width;
	
    width = width*radio;
    height = height*radio;
	
    int xPos = (size.width - width)/2;
    int yPos = (size.height - height)/2;
	
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    // 绘制改变大小的图片
    [self drawInRect:CGRectMake(xPos, yPos, width, height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return scaledImage;
}

//  颜色转换为背景图片
+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return image;
}

//获得某个范围内的屏幕图像
+ (UIImage *)imageFromView:(UIView *)theView atFrame:(CGRect)rect
{
    UIGraphicsBeginImageContextWithOptions(theView.frame.size, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    UIRectClip(rect);
    [theView.layer renderInContext:context];
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return  theImage;
}
- (instancetype)circleImage
{
    // self -> 圆形图片
    // 开启图形上下文
    UIGraphicsBeginImageContext(self.size);
    // 上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 添加一个圆
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    //
    CGContextAddEllipseInRect(context, rect);
    // 裁剪
    CGContextClip(context);
    // 绘制图片到圆上面
    [self drawInRect:rect];
    // 获得图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    // 结束图形上下文
    UIGraphicsEndImageContext();
    
    return image;
}

-(NSData *)imageWithDatabyte:(CGFloat)byte {
    if (![self isKindOfClass:[UIImage class]]) {
        return [NSData data];
    }
    
    UIImage *image = self;
    CGFloat compressionQuality = 1.0;
    NSData *data = UIImagePNGRepresentation(image);
    while (data.length/1024.0 >byte) {
        data = UIImageJPEGRepresentation(image, compressionQuality);
        compressionQuality -= 0.1;
        if(compressionQuality < 0.2) return data;
    }
    return data;
}

@end
