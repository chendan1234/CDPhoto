//
//  CDPhotoPickerBrowserViewController.h
//  CDPhotoBrowser
//
//  Created by 陈丹 on 3/8/2019.
//  Copyright (c) 2019年 L&G. All rights reserved.

#import <UIKit/UIKit.h>
#import "CDPhotoPickerBrowserPhoto.h"
#import "CDPhotoPickerCommon.h"
#import "CDPhotoPickerCustomToolBarView.h"
#import "CDPhotoPickerBrowserPhotoScrollView.h"

@class CDPhotoPickerBrowserViewController;

@protocol CDPhotoPickerBrowserViewControllerDataSource <NSObject>

@optional
/**
 *  有多少组
 */
- (NSInteger)numberOfSectionInPhotosInPickerBrowser:(CDPhotoPickerBrowserViewController *)pickerBrowser;

@required
/**
 *  每个组多少个图片
 */
- (NSInteger)photoBrowser:(CDPhotoPickerBrowserViewController *)photoBrowser numberOfItemsInSection:(NSUInteger)section;
/**
 *  每个对应的IndexPath展示什么内容
 */
- (id<CDPhotoPickerBrowserPhoto>)photoBrowser:(CDPhotoPickerBrowserViewController *)pickerBrowser photoAtIndexPath:(NSIndexPath *)indexPath;


@end

@protocol CDPhotoPickerBrowserViewControllerDelegate <NSObject>
@optional

/**
 *  发送按钮和返回按钮按下时调用，向上一级控制器传递selectedAssets
 */
- (void)photoBrowserWillExit:(CDPhotoPickerBrowserViewController *)pickerBrowser;

/**
 *  返回用户自定义的toolBarView(类似tableView FooterView)
 *
 *  @return 返回用户自定义的toolBarView
 */
- (CDPhotoPickerCustomToolBarView *)photoBrowserShowToolBarViewWithphotoBrowser:(CDPhotoPickerBrowserViewController *)photoBrowser;
/**
 *  滑动结束的页数
 *
 *  @param page         滑动的页数
 */
- (void)photoBrowser:(CDPhotoPickerBrowserViewController *)photoBrowser didCurrentPage:(NSUInteger)page;
/**
 *  滑动开始的页数
 *
 *  @param page         滑动的页数
 */
- (void)photoBrowser:(CDPhotoPickerBrowserViewController *)photoBrowser willCurrentPage:(NSUInteger)page;

/**
 *  点击发送执行此代理，向上一级控制器传递数据
 *
 *  @param pickerBrowser
 *  @param isOriginal     是否原图
 *  备注：这里不传selectedAssets,选择的照片每点击一次右上角的选择框就传第一次
 */
- (void)photoBrowserSendBtnTouched:(CDPhotoPickerBrowserViewController *)pickerBrowser isOriginal:(BOOL)isOriginal;

@end

@interface CDPhotoPickerBrowserViewController : UIViewController

// @require
// 数据源/代理
@property (nonatomic, weak) id<CDPhotoPickerBrowserViewControllerDataSource> dataSource;
@property (nonatomic, weak) id<CDPhotoPickerBrowserViewControllerDelegate> delegate;

// 展示的图片数组<CDPhotoPickerBrowserPhoto> == [self.dataSource photoBrowser:photoAtIndexPath:]
@property (nonatomic, copy) NSArray<__kindof CDPhotoPickerBrowserPhoto*> *photos;

@property (nonatomic) NSMutableArray<__kindof CDPhotoAssets*>  *selectedAssets;
// 当前提供的组
@property (nonatomic) NSIndexPath *currentIndexPath;

@property (nonatomic) CDShowImageType showType;
// 长按保存图片会调用sheet
@property (nonatomic) UIActionSheet *sheet;
// 需要增加的导航高度
@property (nonatomic, assign) CGFloat navigationHeight;

@property (nonatomic, assign) NSInteger maxCount;

@property (nonatomic, assign) BOOL nightMode;

@property (nonatomic, assign) BOOL isOriginal;
// 放大缩小一张图片的情况下（查看头像）
- (void)showHeadPortrait:(UIImageView *)toImageView;
// 放大缩小一张图片的情况下（查看头像）/ 缩略图是toImageView.image 原图URL
- (void)showHeadPortrait:(UIImageView *)toImageView originUrl:(NSString *)originUrl;
// 刷新数据
- (void)reloadData;
// Category Functions.
- (UIView *)getParsentView:(UIView *)view;

- (id)getParsentViewController:(UIView *)view;

@end
