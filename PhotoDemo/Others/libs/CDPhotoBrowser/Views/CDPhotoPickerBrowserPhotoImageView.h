//
//  CDPhotoPickerBrowserPhotoImageView.h
//  CDPhotoBrowser
//
//  Created by 陈丹 on 3/8/2019.
//  Copyright (c) 2019年 L&G. All rights reserved.

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol CDPhotoPickerBrowserPhotoImageViewDelegate;

@interface CDPhotoPickerBrowserPhotoImageView : UIImageView {}

@property (nonatomic, weak) id <CDPhotoPickerBrowserPhotoImageViewDelegate> tapDelegate;
@property (nonatomic, assign) CGFloat progress;

- (void)addScaleBigTap;
- (void)removeScaleBigTap;

@end

@protocol CDPhotoPickerBrowserPhotoImageViewDelegate <NSObject>

@optional
- (void)imageView:(UIImageView *)imageView singleTapDetected:(UITouch *)touch;
- (void)imageView:(UIImageView *)imageView doubleTapDetected:(UITouch *)touch;

@end
