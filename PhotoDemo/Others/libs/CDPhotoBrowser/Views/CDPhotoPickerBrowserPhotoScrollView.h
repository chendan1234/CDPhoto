//
//  CDPhotoPickerBrowserPhotoScrollView.h
//  CDPhotoBrowser
//
//  Created by 陈丹 on 3/8/2019.
//  Copyright (c) 2019年 L&G. All rights reserved.

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CDPhotoPickerBrowserPhotoImageView.h"
#import "CDPhotoPickerBrowserPhotoView.h"
#import "CDPhotoPickerBrowserPhoto.h"
#import "CDPhoto.h"


typedef void(^scrollViewCallBackBlock)(id obj);

@class CDPhotoPickerBrowserPhotoScrollView;

@protocol CDPhotoPickerPhotoScrollViewDelegate <NSObject>
@optional
// 单击调用
- (void) pickerPhotoScrollViewDidSingleClick:(CDPhotoPickerBrowserPhotoScrollView *)photoScrollView;

- (void) pickerPhotoScrollViewDidLongPressed:(CDPhotoPickerBrowserPhotoScrollView *)photoScrollView;

@end

@interface CDPhotoPickerBrowserPhotoScrollView : UIScrollView <UIScrollViewDelegate, CDPhotoPickerBrowserPhotoImageViewDelegate,CDPhotoPickerBrowserPhotoViewDelegate>

@property (nonatomic) CDPhotoPickerBrowserPhoto *photo;

@property (nonatomic) CDPhotoPickerBrowserPhotoImageView *photoImageView;

@property (nonatomic, weak) id <CDPhotoPickerPhotoScrollViewDelegate> photoScrollViewDelegate;

@property (nonatomic) CDShowImageType showType;
// 单击销毁的block
@property (nonatomic, copy) scrollViewCallBackBlock callback;

- (void)setMaxMinZoomScalesForCurrentBounds;

@end
