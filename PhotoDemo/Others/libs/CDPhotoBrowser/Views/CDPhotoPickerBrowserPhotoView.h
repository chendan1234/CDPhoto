//
//  CDPhotoPickerBrowserPhotoView.h
//  CDPhotoBrowser
//
//  Created by 陈丹 on 3/8/2019.
//  Copyright (c) 2019年 L&G. All rights reserved.年 Tomy All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol CDPhotoPickerBrowserPhotoViewDelegate;

@interface CDPhotoPickerBrowserPhotoView : UIView {}

@property (nonatomic, weak) id <CDPhotoPickerBrowserPhotoViewDelegate> tapDelegate;

@end

@protocol CDPhotoPickerBrowserPhotoViewDelegate <NSObject>

@optional

- (void)view:(UIView *)view singleTapDetected:(UITouch *)touch;

- (void)view:(UIView *)view doubleTapDetected:(UITouch *)touch;

@end
