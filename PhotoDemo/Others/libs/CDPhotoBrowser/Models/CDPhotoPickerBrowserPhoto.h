//
//  PickerPhoto.h
//  CDPhotoBrowser
//
//  Created by 陈丹 on 3/8/2019.
//  Copyright (c) 2019年 L&G. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "CDPhotoAssets.h"


#define CDPhotoImageDidStartLoad @"CDPhotoImageDidStartLoad"
#define CDPhotoImageDidFinishLoad @"CDPhotoImageDidFinishLoad"
#define CDPhotoImageDidFailLoadWithError @"CDPhotoImageDidFailLoadWithError"

@protocol CDPhotoPickerBrowserPhoto <NSObject>


@end

@interface CDPhotoPickerBrowserPhoto : NSObject<CDPhotoPickerBrowserPhoto>

@property (nonatomic) UIView *photoLoadingView;
@property (nonatomic) UIButton *loadOriginButton;

/**
 *  自动适配以下几种数据
 */
@property (nonatomic) id photoObj;
/**
 *  传入对应的UIImageView,记录坐标
 */
@property (nonatomic) UIImageView *toView;
/**
 *  保存相册模型
 */
@property (nonatomic) CDPhotoAssets *asset;
/**
 *  URL地址
 */
@property (nonatomic) NSURL *photoURL;
/**
 *  本地路径
 */
@property (nonatomic, copy) NSString *photoPath;
/**
 *  原图或全屏图，也就是要显示的图
 */
@property (nonatomic) UIImage *photoImage;
/**
 *  缩略图
 */
@property (nonatomic) UIImage *thumbImage;
/**
 *  是否被选中
 */
@property (nonatomic, assign) BOOL isSelected;

@property (nonatomic, assign) BOOL isLoading;
/**
 *  传入一个图片对象，可以是URL/UIImage/NSString，返回一个实例
 */
+ (instancetype)photoAnyImageObjWith:(id)imageObj;

- (instancetype)initWithAnyObj:(id)imageObj;

- (void)loadImageFromFileAsync:(NSString *)path;

- (void)loadImageFromURLAsync:(NSURL *)url;

- (void)notifyImageDidStartLoad;

- (void)notifyImageDidFinishLoad;

- (void)notifyImageDidFailLoadWithError:(NSError *)erro;

@end
