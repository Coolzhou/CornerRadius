//
//  UIView+CornerRadius.h
//  CornerRadiusOC
//
//  Created by Apple on 2018/2/27.
//  Copyright © 2018年 Apple. All rights reserved.
//  UIView 圆角设置

#import <UIKit/UIKit.h>

@interface UIView (CornerRadius)

/**
 添加圆角
 默认边框宽度1，边框颜色白色，背景颜色
 @param radius 圆角大小
 */
- (void)view_addCorner:(CGFloat)radius;

/**
 添加圆角

 @param radius 圆角大小
 @param borderWidth 边框宽度
 @param borderColor 边框颜色
 @param backgroundColor 背景颜色
 */
- (void)view_addCorner:(CGFloat)radius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor backgroundColor:(UIColor *)backgroundColor;

@end
