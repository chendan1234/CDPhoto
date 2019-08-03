


//
//  CDHelper.m
//  zhenxuanyouping
//
//  Created by apple on 8/4/2019.
//  Copyright © 2019 华博金创. All rights reserved.
//

#import "CDHelper.h"

@implementation CDHelper


#pragma mark---------------单利---------------
+(id)shareInstace{
    static id shareInstace = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstace = [[CDHelper alloc]init];
    });
    return shareInstace;
}

#pragma mark---------------获取当前view 的 viewcontroller---------------
+(UIViewController*)viewControllerWithView:(UIView *)view{
    UIView *tmpSupView = view.superview;
    UIResponder* nextResponder = [tmpSupView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]]) {
        return (UIViewController*)nextResponder;
    }else{
        return [CDHelper viewControllerWithView:tmpSupView];
    }
}

#pragma mark---------------获取当前屏幕显示的viewcontroller---------------
+(UIViewController *)getCurrentVC
{
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
    
    return result;
}


@end
