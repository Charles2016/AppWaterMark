>公司业务有个需求说是要对app内所有页面都添加水印，比如账号和日期的，然后研究了一下，在keywindow层上面添加一次就OK了，不用每个页面都加一遍。

####主要思路是用for循环在view上添加CATextLayer控件，弄些透明度，然后将其旋转，显示即可，效果如下。
![添加水印效果.png](https://upload-images.jianshu.io/upload_images/1984312-c44eb29528b698da.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/320)
####主要代码如下，可自行设置行列数量：
```
- (void)addWaterMarkText:(NSString*)waterText WithTextColor:(UIColor*)color WithFont:(UIFont*)font WithOpacity:(float)opacity {
    //计算水印文字的宽高
    NSString *waterMark = waterText;
    CGSize textSize = [waterMark sizeWithAttributes:@{NSFontAttributeName:font}];
    CGFloat height =  [UIScreen mainScreen].bounds.size.height;
    CGFloat width =  [UIScreen mainScreen].bounds.size.width-50;
    NSInteger row = 5; //行
    NSInteger col = 2; //列
   
    for (int i = 0; i < row; i ++) {
        for (int j = 0; j < col; j ++) {
            CATextLayer *textLayer = [[CATextLayer alloc]init];
            textLayer.contentsScale = [UIScreen mainScreen].scale;//按当前屏幕分辨显示，否则会模糊
            CFStringRef fontName = (__bridge CFStringRef)font.fontName;
            CGFontRef fontRef =CGFontCreateWithFontName(fontName);
            textLayer.font = fontRef;
            textLayer.fontSize = font.pointSize;
            textLayer.foregroundColor = color.CGColor;
            textLayer.string = waterMark;
            textLayer.opacity = opacity;
            textLayer.frame = CGRectMake(50+j*width/col,  50+i*(height/5), textSize.width, textSize.height);
            //旋转文字
            textLayer.transform = CATransform3DMakeRotation(-M_PI/8, 0,0,3);
            [self.layer addSublayer:textLayer];
        }
    }
}
```
