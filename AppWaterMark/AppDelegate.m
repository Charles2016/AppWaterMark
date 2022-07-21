//
//  AppDelegate.m
//  AppWaterMark
//
//  Created by 1084-Wangcl-Mac on 2022/7/21.
//  Copyright © 2022 Charles2021. All rights reserved.
//

#import "AppDelegate.h"
#import "UIView+WaterMark.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = UIColor.whiteColor;
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:[[ViewController alloc]init]];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    
    //添加水印
    [self addWaterMark];
    return YES;
}

- (void)addWaterMark {
    /*
    若在AppDelegate处添加则直接取self.window即可,其他地方添加取keywindow
    UIWindow *keywindow = [UIApplication sharedApplication].keyWindow;
    if (keywindow == nil) {
        keywindow = [UIApplication sharedApplication].windows.lastObject;
    }*/
    NSString *name = @"woshicoder2";
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateStr = [outputFormatter stringFromDate:[NSDate date]];
    NSString *markText = [NSString stringWithFormat:@"%@\n%@",name, dateStr];
    [self.window addWaterMarkText:markText WithTextColor:UIColor.blueColor WithFont:[UIFont systemFontOfSize:14.0] WithOpacity:0.3];
}


@end
