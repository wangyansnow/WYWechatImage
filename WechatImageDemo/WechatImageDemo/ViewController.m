//
//  ViewController.m
//  WechatImageDemo
//
//  Created by 王俨 on 15/10/22.
//  Copyright © 2015年 wangyan. All rights reserved.
//

#import "ViewController.h"
#import "WYArrowImageTool.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)setupUI {
    UIImage *image = [UIImage imageNamed:@"ball"];

    // 左尖角
    UIImageView *leftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 100, 90, 160)];
    leftImageView.image = [WYArrowImageTool arrowLeftImage:image size:leftImageView.bounds.size];
    [self.view addSubview:leftImageView];
    
    // 右尖角
    UIImage *arrowRightImage = [WYArrowImageTool arrowRightImage:image size:CGSizeMake(90, 160)];
    UIImageView *rightImageView = [[UIImageView alloc] initWithImage:arrowRightImage];
    rightImageView.frame = CGRectOffset(leftImageView.frame, 130, 0);
    [self.view addSubview:rightImageView];
}



@end
