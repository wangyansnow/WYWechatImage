//
//  WYArrowImageTool.h
//  WechatImageDemo
//
//  Created by 王启镰 on 16/3/8.
//  Copyright © 2016年 wangyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WYArrowImageTool : NSObject


///  返回一张尖角图片, 尖角朝右
///
///  @param image     图片
///  @param imageSize 尖角图片大小
///
///  @return 尖角朝右的图片
+ (UIImage *)arrowRightImage:(UIImage *)image size:(CGSize)imageSize;

///  返回一张尖角图片, 尖角朝左
///
///  @param image     图片
///  @param imageSize 尖角图片大小
///
///  @return 尖角朝左的图片
+ (UIImage *)arrowLeftImage:(UIImage *)image size:(CGSize)imageSize;

@end
