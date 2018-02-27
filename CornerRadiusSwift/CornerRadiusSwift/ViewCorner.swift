//
//  ViewCorner.swift
//  CornerRadiusSwift
//
//  Created by Apple on 2018/2/27.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class ViewCorner: NSObject {

}

extension UIView {
    
    /// 给View增加圆角
    ///
    /// - Parameter radius: 圆角大小
    func view_addCorner(radius: CGFloat) {
        self.view_addCorner(radius: radius, borderWidth: 1, backgroundColor: UIColor.clear, borderColor: UIColor.white)
    }
    
    func view_addCorner(radius: CGFloat,
                      borderWidth: CGFloat,
                      backgroundColor: UIColor,
                      borderColor: UIColor) {
        let imageView = UIImageView(image: view_drawRectWithRoundedCorner(radius: radius,
                                                                        borderWidth: borderWidth,
                                                                        backgroundColor: backgroundColor,
                                                                        borderColor: borderColor))
        self.insertSubview(imageView, at: 0)
    }
    
    func view_drawRectWithRoundedCorner(radius: CGFloat,
                                      borderWidth: CGFloat,
                                      backgroundColor: UIColor,
                                      borderColor: UIColor) -> UIImage {
        
        
        let sizeToFit = CGSize(width: self.bounds.size.width, height: self.bounds.size.height)
        let halfBorderWidth = CGFloat(borderWidth / 2.0)
        
        UIGraphicsBeginImageContextWithOptions(sizeToFit, false, UIScreen.main.scale)
        let context = UIGraphicsGetCurrentContext()
        
        context?.setLineWidth(borderWidth)
        context?.setStrokeColor(borderColor.cgColor)
        context?.setFillColor(backgroundColor.cgColor)
        
        let width = sizeToFit.width, height = sizeToFit.height
        
        // 开始坐标右边开始
        context?.move(to: CGPoint.init(x: width - halfBorderWidth, y: radius + halfBorderWidth))
        // 右下角角度
        context?.addArc(tangent1End: CGPoint.init(x: width - halfBorderWidth, y: height - halfBorderWidth), tangent2End: CGPoint.init(x: width - radius - halfBorderWidth, y: height - halfBorderWidth), radius: radius)
        // 左下角角度
        context?.addArc(tangent1End: CGPoint.init(x: halfBorderWidth, y: height - halfBorderWidth), tangent2End: CGPoint.init(x: halfBorderWidth, y: height - halfBorderWidth - radius), radius: radius)
        // 左上角
        context?.addArc(tangent1End: CGPoint.init(x: halfBorderWidth, y: halfBorderWidth), tangent2End: CGPoint.init(x: width - halfBorderWidth - radius, y: halfBorderWidth), radius: radius)
        // 右上角
        context?.addArc(tangent1End: CGPoint.init(x: width - halfBorderWidth, y:  halfBorderWidth), tangent2End: CGPoint.init(x: width - halfBorderWidth, y: height - halfBorderWidth - radius), radius: radius)
        
        context?.drawPath(using: .fillStroke)
        
        let image:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}

extension UIImageView {
    
    /// image 不为空时给UIImageView绘制圆角
    ///
    /// - Parameter radius: 圆角大小
    func image_addCorner(radius: CGFloat) {

        self.image = self.image?.image_drawRectWithRoundedCorner(radius: radius, self.bounds.size)
    }
}

extension UIImage {
    
    func image_drawRectWithRoundedCorner(radius: CGFloat, _ sizetoFit: CGSize) -> UIImage {
        let rect = CGRect(origin: CGPoint(x: 0, y: 0), size: sizetoFit)
        //开启上下文
        UIGraphicsBeginImageContextWithOptions(sizetoFit, false, UIScreen.main.scale)
        //获取上下文
        let context = UIGraphicsGetCurrentContext()
        
        //添加路径
        context?.addPath(UIBezierPath.init(roundedRect: rect, byRoundingCorners: UIRectCorner.allCorners, cornerRadii: CGSize.init(width: radius, height: radius)).cgPath)
        
        //裁剪
        context?.clip()
        //绘制大小
        self.draw(in: rect)
        
        // 在上下文依路径绘制
        context?.drawPath(using: .fillStroke)
        
        //获取图片
        let image:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        //关闭上下文
        UIGraphicsEndImageContext()
        
        return image
    }
}
