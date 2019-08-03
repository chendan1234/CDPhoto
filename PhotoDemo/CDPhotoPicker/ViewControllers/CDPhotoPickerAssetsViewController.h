//
//  CDPhotoPickerAssetsViewController.h
//  CDPhotoBrowser
//
//  Created by 陈丹 on 3/8/2019.
//  Copyright (c) 2019年 L&G. All rights reserved.

#import <UIKit/UIKit.h>
#import "CDPhotoPickerCommon.h"
#import "CDPhotoPickerGroupViewController.h"

@class CDPhotoPickerGroup;

@interface CDPhotoPickerAssetsViewController : UIViewController

@property (nonatomic, assign) PickerViewShowStatus status;
//决定以什么风格显示相册，有原图选择按钮？有多选功能？
@property (nonatomic) CDShowImageType showType;

@property (nonatomic) CDPhotoPickerGroup *assetsGroup;

@property (nonatomic, assign) NSInteger maxCount;

@property (nonatomic, assign) BOOL nightMode;
// 需要记录选中的值的数据
@property (nonatomic, copy) NSArray *selectPickerAssets;
// 置顶展示图片
@property (nonatomic, assign) BOOL topShowPhotoPicker;

@property (nonatomic, copy) void(^selectedAssetsBlock)(NSMutableArray *selectedAssets);

- (instancetype)initWithShowType:(CDShowImageType)showType;

@end
