//
//  UIView+WaterMark.h
//  NewProject
//
//  Created by 1084-Wangcl-Mac on 2022/7/13.
//  Copyright © 2022 Charles. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (WaterMark)

- (void)addWaterMarkText:(NSString*)waterText WithTextColor:(UIColor*)color WithFont:(UIFont*)font WithOpacity:(float)opacity;

@end

NS_ASSUME_NONNULL_END
