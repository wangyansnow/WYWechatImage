//
//  WYArrowImageTool.m
//  WechatImageDemo
//
//  Created by 王启镰 on 16/3/8.
//  Copyright © 2016年 wangyan. All rights reserved.
//

#import "WYArrowImageTool.h"

#define kArrowWidth 6       // 尖角宽度
#define kArrowMarginTop 13  // 尖角距离顶部距离
#define kArrowHeight 10     // 尖角高度

@implementation WYArrowImageTool

///  返回一张尖角图片, 尖角朝右
///
///  @param image     图片
///  @param imageSize 尖角图片大小
///
///  @return 尖角朝右的图片
+ (UIImage *)arrowRightImage:(UIImage *)image size:(CGSize)imageSize {
    //1.创建图片上下文
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0.0);
    //2.获取图片上下文
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    
    //3.创建路径
    CGFloat imageW = imageSize.width;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, imageSize.width - kArrowWidth, imageSize.height) cornerRadius:6];
    
    [path moveToPoint:CGPointMake(imageW - kArrowWidth, 0)];
    [path addLineToPoint:CGPointMake(imageW - kArrowWidth, kArrowMarginTop)];
    [path addLineToPoint:CGPointMake(imageW, kArrowMarginTop + 0.5 * kArrowHeight)];
    [path addLineToPoint:CGPointMake(imageW - kArrowWidth, kArrowMarginTop + kArrowHeight)];
    [path closePath];
    //4.把路径添加到上下文中
    CGContextAddPath(contextRef, path.CGPath);
    
    //5.裁剪上下文
    CGContextEOClip(contextRef);
    
    //6.把图片画到上下文中
    [image drawInRect:CGRectMake(0, 0, imageSize.width, imageSize.height)];
    
    //7.从上下文中取出图片
    UIImage *arrowImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //8.卸磨杀驴
    UIGraphicsEndImageContext();
    
    return arrowImage;
}

///  返回一张尖角图片, 尖角朝左
///
///  @param image     图片
///  @param imageSize 尖角图片大小
///
///  @return 尖角朝左的图片
+ (UIImage *)arrowLeftImage:(UIImage *)image size:(CGSize)imageSize {
    //1.创建图片上下文
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0.0);
    //2.获取图片上下文
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    
    //3.创建路径
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(kArrowWidth, 0, imageSize.width - kArrowWidth, imageSize.height) cornerRadius:6];
    
    [path moveToPoint:CGPointMake(kArrowWidth, 0)];
    [path addLineToPoint:CGPointMake(kArrowWidth, kArrowMarginTop)];
    [path addLineToPoint:CGPointMake(0, kArrowMarginTop + 0.5 * kArrowHeight)];
    [path addLineToPoint:CGPointMake(kArrowWidth, kArrowMarginTop + kArrowHeight)];
    [path closePath];
    //4.把路径添加到上下文中
    CGContextAddPath(contextRef, path.CGPath);
    
    //5.裁剪上下文
    CGContextEOClip(contextRef);
    
    //6.把图片画到上下文中
    [image drawInRect:CGRectMake(0, 0, imageSize.width, imageSize.height)];
    
    //7.从上下文中取出图片
    UIImage *arrowImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //8.卸磨杀驴
    UIGraphicsEndImageContext();

    return arrowImage;
}


@end
