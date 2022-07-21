//
//  ViewController.m
//  AppWaterMark
//
//  Created by 1084-Wangcl-Mac on 2022/7/21.
//  Copyright © 2022 Charles2021. All rights reserved.
//

#import "ViewController.h"
#import "UIView+WaterMark.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake((self.view.frame.size.width - 120) / 2, 180, 120, 60);
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    [button setTitle:@"点一点" forState:UIControlStateNormal];
    button.backgroundColor = UIColor.redColor;
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}




#pragma mark - buttonActions
- (void)buttonAction:(UIButton *)button {
    NSLog(@"按钮显示在水印的下方了！");
}

@end
