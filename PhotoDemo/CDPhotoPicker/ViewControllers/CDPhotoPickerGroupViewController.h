//
//  CDPhotoPickerGroupViewController.h
//  CDPhotoBrowser
//
//  Created by 陈丹 on 3/8/2019.
//  Copyright (c) 2019年 L&G. All rights reserved.

#import <UIKit/UIKit.h>
#import "CDPhotoPickerViewController.h"

@interface CDPhotoPickerGroupViewController : UIViewController

@property (nonatomic, weak) id<CDPhotoPickerViewControllerDelegate> delegate;
@property (nonatomic, assign) PickerViewShowStatus status;
@property (nonatomic) CDShowImageType showType;
@property (nonatomic, assign) NSInteger maxCount;
// 记录选中的值
@property (nonatomic) NSMutableArray *selectAsstes;
// 置顶展示图片
@property (nonatomic, assign) BOOL topShowPhotoPicker;
// 夜间模式
@property (nonatomic, assign) BOOL nightMode;

- (instancetype)initWithShowType:(CDShowImageType)showType;

@end
