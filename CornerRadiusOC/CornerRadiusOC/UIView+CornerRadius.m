//
//  UIView+CornerRadius.m
//  CornerRadiusOC
//
//  Created by Apple on 2018/2/27.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "UIView+CornerRadius.h"

@implementation UIView (CornerRadius)

- (void)view_addCorner:(CGFloat)radius{
    
    [self view_addCorner:radius borderWidth:1 borderColor:[UIColor whiteColor] backgroundColor:[UIColor whiteColor]];
    
}

- (void)view_addCorner:(CGFloat)radius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor backgroundColor:(UIColor *)backgroundColor{
    
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[self view_drawRectWithRoundedCorner:radius borderWidth:borderWidth borderColor:borderColor backgroundColor:backgroundColor]];
    
    [self insertSubview:imageView atIndex:0];
    
}

- (UIImage *)view_drawRectWithRoundedCorner:(CGFloat)radius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor backgroundColor:(UIColor *)backgroundColor{
    
    CGSize sizeFit = CGSizeMake(self.bounds.size.width, self.bounds.size.height);
    CGFloat halfBorderWidth = borderWidth / 2.0;
    
    //开启图形上下文
    UIGraphicsBeginImageContextWithOptions(sizeFit, NO, [UIScreen mainScreen].scale);
    //获取上下文
    CGContextRef context =  UIGraphicsGetCurrentContext();
    //设置边框线
    CGContextSetLineWidth(context, borderWidth);
    CGContextSetStrokeColorWithColor(context, borderColor.CGColor);
    CGContextSetFillColorWithColor(context, backgroundColor.CGColor);
    
    CGFloat width = sizeFit.width;
    CGFloat height = sizeFit.height;
    
    CGContextMoveToPoint(context, width - halfBorderWidth, radius + halfBorderWidth);  // 开始坐标右边开始
    CGContextAddArcToPoint(context, width - halfBorderWidth, height - halfBorderWidth, width - radius - halfBorderWidth, height - halfBorderWidth, radius);  // 右下角角度
    CGContextAddArcToPoint(context, halfBorderWidth, height - halfBorderWidth, halfBorderWidth, height - radius - halfBorderWidth, radius); // 左下角角度
    CGContextAddArcToPoint(context, halfBorderWidth, halfBorderWidth, width - halfBorderWidth, halfBorderWidth, radius); // 左上角
    CGContextAddArcToPoint(context, width - halfBorderWidth, halfBorderWidth, width - halfBorderWidth, radius + halfBorderWidth, radius); // 右上角
    
    CGContextDrawPath(context, kCGPathFillStroke);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
