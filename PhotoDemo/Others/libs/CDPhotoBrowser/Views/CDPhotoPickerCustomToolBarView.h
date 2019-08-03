//
//  CDPhotoPickerCustomToolBarView.h
//  CDPhotoBrowser
//
//  Created by 陈丹 on 3/8/2019.
//  Copyright (c) 2019年 L&G. All rights reserved.

/**
 *  Note: 图片游览器自定义View
 *  在里面创建的控件会添加到 ZLPhotoPickerBrowserViewController view里面
 */
#import <UIKit/UIKit.h>
#import "CDPhotoPickerCommon.h"

@protocol CDPhotoPickerCustomToolBarViewDelegate <NSObject>

- (void)customToolBarIsOriginalBtnTouched;

- (void)customToolBarSendBtnTouched;

@end

@interface CDPhotoPickerCustomToolBarView : UIView

@property (nonatomic, copy) NSString *(^getSizeBlock)(void);

@property (nonatomic, assign) BOOL nightMode;

@property (nonatomic, weak) id<CDPhotoPickerCustomToolBarViewDelegate>delegate;

- (void)updateToolbarWithOriginal:(BOOL)isOriginal
                      currentPage:(NSInteger)currentPage
                    selectedCount:(NSInteger)count;
@end
