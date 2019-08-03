//
//  CDHelper.h
//  zhenxuanyouping
//
//  Created by apple on 8/4/2019.
//  Copyright © 2019 华博金创. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CDHelper : NSObject

//单例
+(id)shareInstace;
//获取当前view的viewcontroller
+(UIViewController*)viewControllerWithView:(UIView*)view;
//获取当前屏幕显示的viewcontroller
+(UIViewController *)getCurrentVC;

@end

NS_ASSUME_NONNULL_END
