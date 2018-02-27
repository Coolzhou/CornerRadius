//
//  UIImageView+CornerRadius.m
//  CornerRadiusOC
//
//  Created by Apple on 2018/2/27.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "UIImageView+CornerRadius.h"

@implementation UIImageView (CornerRadius)

- (void)image_addCornerRadius:(CGFloat)radius{
    
    self.image = [self image_drawRectWithRoundedCorner:radius size:self.bounds.size];
    
}

- (UIImage *)image_drawRectWithRoundedCorner:(CGFloat)radius size:(CGSize)size{
    
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    //开启上下文
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    //获取上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //路径
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(radius, radius)];
    //将路径添加到上下文
    CGContextAddPath(context, path.CGPath);
    //按路径裁剪
    CGContextClip(context);
    [self drawRect:rect];
    //绘制
    CGContextDrawPath(context, kCGPathFillStroke);
    //获取新图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    //关闭上下文
    UIGraphicsEndImageContext();    
    return image;
}

@end
