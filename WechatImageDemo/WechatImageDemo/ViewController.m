//
//  ViewController.m
//  WechatImageDemo
//
//  Created by 王俨 on 15/10/22.
//  Copyright © 2015年 wangyan. All rights reserved.
//

#import "ViewController.h"
#define MinImage 45
#define ImageWidth 120


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *image = [UIImage imageNamed:@"ball"];
    UIImage *clipedImage = [self arrowImage:image];
    
    self.imageView.image = clipedImage;
    
    UIImageView *iv = [[UIImageView alloc] initWithImage:clipedImage];
    [self.view addSubview:iv];
    iv.center = self.view.center;
    
    
}

- (IBAction)sendBtnClick:(UIButton *)sender {
    NSLog(@"sendBtnClick:");
}

/// 返回一张尖角图片
- (UIImage *)arrowImage:(UIImage *)image {
    
    //1.创建图片上下文
    CGSize imageSize = [self handleImage:image.size];
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0.0);
    //2.获取图片上下文
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    
    //3.创建路径
    CGFloat arrowWidth = 6;
    CGFloat marginTop = 13;
    CGFloat arrowHeight = 10;
    CGFloat imageW = imageSize.width;

    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, imageSize.width - arrowWidth, imageSize.height) cornerRadius:5];
    
    [path moveToPoint:CGPointMake(imageW - arrowWidth, 0)];
    [path addLineToPoint:CGPointMake(imageW - arrowWidth, marginTop)];
    [path addLineToPoint:CGPointMake(imageW, marginTop + 0.5 * arrowHeight)];
    [path addLineToPoint:CGPointMake(imageW - arrowWidth, marginTop + arrowHeight)];
    [path closePath];
    //4.把路径添加到上下文中
    CGContextAddPath(contextRef, path.CGPath);
    
    //5.裁剪上下文
    CGContextEOClip(contextRef);
    
    //6.把图片画到上下文中
    [image drawInRect:CGRectMake(0, 0, imageSize.width, imageSize.height)];
    
    //7.从上下文中取出图片
    UIImage *clipedImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //8.卸磨杀驴
    UIGraphicsEndImageContext();
    
    return clipedImage;
}

- (CGSize)handleImage:(CGSize)retSize {
    if (retSize.width > retSize.height) {
        CGFloat height =  ImageWidth / retSize.width  *  retSize.height;
        retSize.height = height;
        retSize.width = ImageWidth;
    }else {
        CGFloat width = ImageWidth / retSize.height * retSize.width;
        retSize.width = width;
        retSize.height = ImageWidth;
    }
    return retSize;
}

- (UIImage *)arrowYouImage:(UIImage *)image {
    
    //1.创建图片上下文
    CGSize imageSize = [self handleImage:image.size];
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0.0);
    //2.获取图片上下文
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    
    //3.创建路径
    CGFloat arrowWidth = 6;
    CGFloat marginTop = 13;
    CGFloat arrowHeight = 10;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(arrowWidth, 0, imageSize.width - arrowWidth, imageSize.height) cornerRadius:5];
    
    [path moveToPoint:CGPointMake(arrowWidth, 0)];
    [path addLineToPoint:CGPointMake(arrowWidth, marginTop)];
    [path addLineToPoint:CGPointMake(0, marginTop + 0.5 * arrowHeight)];
    [path addLineToPoint:CGPointMake(arrowWidth, marginTop + arrowHeight)];
    [path closePath];
    //4.把路径添加到上下文中
    CGContextAddPath(contextRef, path.CGPath);
    
    //5.裁剪上下文
    CGContextEOClip(contextRef);
    
    //6.把图片画到上下文中
    [image drawInRect:CGRectMake(0, 0, imageSize.width, imageSize.height)];
    
    //7.从上下文中取出图片
    UIImage *clipedImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //8.卸磨杀驴
    UIGraphicsEndImageContext();
    
    return clipedImage;
}

@end
