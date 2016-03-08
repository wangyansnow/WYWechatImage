# WYWechatImage #
高仿微信的尖角图片

## 如何使用WYArrowImage ##

- 手动导入:
    * 将`WYArrowTool`整个文件夹拖入到项目中
    * 导入头文件: `WYArrowToo.h`

## 在代码中如何使用 ##
```objctive-c
    UIImage *image = [UIImage imageNamed:@"ball"];

    // 左尖角
    UIImageView *leftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 90, 160)];
    leftImageView.image = [WYArrowImageTool arrowLeftImage:image size:leftImageView.bounds.size];
    [self.view addSubview:leftImageView];
    
    // 右尖角
    UIImage *arrowRightImage = [WYArrowImageTool arrowRightImage:image size:CGSizeMake(90, 160)];
    UIImageView *rightImageView = [[UIImageView alloc] initWithImage:arrowRightImage];
    rightImageView.center = self.view.center;
    [self.view addSubview:rightImageView];
```
### 效果图 ###
![image](https://github.com/wangyansnow/WYWechatImage/raw/master/ArrowScreen.png)

