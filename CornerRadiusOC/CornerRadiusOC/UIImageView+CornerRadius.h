//
//  UIImageView+CornerRadius.h
//  CornerRadiusOC
//
//  Created by Apple on 2018/2/27.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (CornerRadius)

/**
 给UIImageView 添加圆角

 @param radius 圆角大小
 */
- (void)image_addCornerRadius:(CGFloat)radius;

@end
