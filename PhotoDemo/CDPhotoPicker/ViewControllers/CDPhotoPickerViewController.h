//
//  CDPickerViewController.h
//  CDPhotoBrowser
//
//  Created by 陈丹 on 3/8/2019.
//  Copyright (c) 2019年 L&G. All rights reserved.

#import <UIKit/UIKit.h>
#import "CDPhotoPickerCommon.h"
#import "CDPhotoAssets.h"
// 回调
typedef void(^CDcallBackBlock)(id obj);
@class CDPhotoPickerViewController;
// 状态组
typedef NS_ENUM(NSInteger , PickerViewShowStatus) {
    PickerViewShowStatusGroup = 0, // default groups .
    PickerViewShowStatusCameraRoll ,
    PickerViewShowStatusSavePhotos ,
    PickerViewShowStatusPhotoStream ,
    PickerViewShowStatusVideo,
};

@protocol CDPhotoPickerViewControllerDelegate <NSObject>
/**
 *  返回所有的Asstes对象
 *
 *  @param original:是否原图
 *  @param assets:所选照片
 */
- (void)pickerViewControllerDoneAsstes:(NSArray <CDPhotoAssets *> *)assets isOriginal:(BOOL)original;

@end

@interface CDPhotoPickerViewController : UIViewController

// @optional
@property (nonatomic, weak) id<CDPhotoPickerViewControllerDelegate>delegate;
// 决定你是否需要push到内容控制器, 默认显示组
@property (nonatomic, assign) PickerViewShowStatus status;
// 决定以什么风格显示相册，有原图选择按钮？有多选功能？
@property (nonatomic) CDShowImageType showType;
// 可以用代理来返回值或者用block来返回值
@property (nonatomic, copy) CDcallBackBlock callBack;
// 每次选择图片的最小数, 默认与最大数是9
@property (nonatomic, assign) NSInteger maxCount;
//黑夜模式 默认0
@property (nonatomic, assign) BOOL nightMode;
// 记录选中的值
@property (strong, nonatomic) NSArray *selectPickers;
// 置顶展示图片
@property (assign, nonatomic) BOOL topShowPhotoPicker;

// @function
- (instancetype)initWithShowType:(CDShowImageType)showType;
// 展示控制器
- (void)showPickerVc:(UIViewController *)vc;

@end
