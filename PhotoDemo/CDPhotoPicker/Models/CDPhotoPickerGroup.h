//
//  CDPickerGroup.h
//  CDPhotoBrowser
//
//  Created by 陈丹 on 3/8/2019.
//  Copyright (c) 2019年 L&G. All rights reserved.

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface CDPhotoPickerGroup : NSObject

/**
 *  组名
 */
@property(nonatomic, copy)NSString *groupName;

/**
 *  缩略图
 */
@property(nonatomic) UIImage *thumbImage;

/**
 *  组里面的图片个数
 */
@property(nonatomic, assign)NSInteger assetsCount;

/**
 *  类型 : Saved Photos...
 */
@property (nonatomic ,copy)NSString *type;

@property (nonatomic)ALAssetsGroup *group;

@end
