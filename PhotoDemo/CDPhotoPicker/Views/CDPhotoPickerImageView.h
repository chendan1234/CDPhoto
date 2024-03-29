//
//  CDPickerImageView.h
//  CDPhotoBrowser
//
//  Created by 陈丹 on 3/8/2019.
//  Copyright (c) 2019年 L&G. All rights reserved.

#import <UIKit/UIKit.h>

@interface CDPhotoPickerImageView : UIImageView

/**
 *  是否有蒙版层
 */
@property (nonatomic, assign, getter=isMaskViewFlag) BOOL maskViewFlag;
/**
 *  蒙版层的颜色,默认白色
 */
@property (nonatomic) UIColor *maskViewColor;
/**
 *  蒙版的透明度,默认 0.5
 */
@property (nonatomic, assign) CGFloat maskViewAlpha;
/**
 *  是否有右上角打钩的按钮
 */
@property (nonatomic, assign) BOOL animationRightTick;
/**
 *  是否视频类型
 */
@property (nonatomic, assign) BOOL isVideoType;

@end
