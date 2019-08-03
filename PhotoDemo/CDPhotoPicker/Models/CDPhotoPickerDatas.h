//
//  CDPickerDatas.h
//  CDPhotoBrowser
//
//  Created by 陈丹 on 3/8/2019.
//  Copyright (c) 2019年 L&G. All rights reserved.

#import <UIKit/UIKit.h>

@class CDPhotoPickerGroup;

// 回调
typedef void(^groupCallBackBlock)(id obj);

@interface CDPhotoPickerDatas : NSObject

/**
 *  获取所有组
 */
+ (instancetype)defaultPicker;

/**
 * 获取所有组对应的图片
 */
- (void)getAllGroupWithPhotos:(groupCallBackBlock )callBack;

/**
 * 获取所有组对应的Videos
 */
- (void)getAllGroupWithVideos:(groupCallBackBlock )callBack;

/**
 *  传入一个组获取组里面的Asset
 */
- (void)getGroupPhotosWithGroup:(CDPhotoPickerGroup *)pickerGroup finished:(groupCallBackBlock )callBack;

/**
 *  传入一个AssetsURL来获取UIImage
 */
- (void)getAssetsPhotoWithURLs:(NSURL *)url callBack:(groupCallBackBlock )callBack;

@end
