//
//  XGCameraImageView.h
//  XinGe
//
//  Created by 陈丹 on 3/8/2019.
//  Copyright © 2019年 Tomy. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, XGImageOrientation) {
    XGImageOrientationUp,            // default orientation
    XGImageOrientationDown,          // 180 deg rotation
    XGImageOrientationLeft,          // 90 deg CCW
    XGImageOrientationRight,         // 90 deg CW
    XGImageOrientationUpMirrored,    // as above but image mirrored along other axis. horizontal flip
    XGImageOrientationDownMirrored,  // horizontal flip
    XGImageOrientationLeftMirrored,  // vertical flip
    XGImageOrientationRightMirrored, // vertical flip
};

@protocol CDCameraImageViewDelegate <NSObject>

- (void)xgCameraImageViewSendBtnTouched;

- (void)xgCameraImageViewCancleBtnTouched;

@end

@interface CDCameraImageView : UIImageView

@property (nonatomic, weak) id<CDCameraImageViewDelegate>delegate;

@property (nonatomic) UIImage *imageToDisplay;

@property (nonatomic, assign) XGImageOrientation imageOrientation;

@end
