//
//  CDPickerDatas.m
//  CDPhotoBrowser
//
//  Created by 陈丹 on 3/8/2019.
//  Copyright (c) 2019年 L&G. All rights reserved.

#import "CDPhotoPickerDatas.h"
#import "CDPhotoPickerGroup.h"
#import <AssetsLibrary/AssetsLibrary.h>

@interface CDPhotoPickerDatas()

@property (nonatomic)ALAssetsLibrary *library;

@end

@implementation CDPhotoPickerDatas

+ (ALAssetsLibrary *)defaultAssetsLibrary {
    static dispatch_once_t pred = 0;
    static ALAssetsLibrary *library = nil;
    dispatch_once(&pred,^{
        library = [[ALAssetsLibrary alloc] init];
    });
    return library;
}

- (ALAssetsLibrary *)library {
    if (nil == _library) {
        _library = [self.class defaultAssetsLibrary];
    }
    return _library;
}

#pragma mark - getter

+ (instancetype)defaultPicker {
    return [[self alloc] init];
}

#pragma mark -获取所有组

- (void)getAllGroupWithPhotos:(groupCallBackBlock )callBack {
    [self getAllGroupAllPhotos:YES withResource:callBack];
}

- (void)getAllGroupAllPhotos:(BOOL)allPhotos withResource:(groupCallBackBlock)callBack {
    NSMutableArray *groups = [NSMutableArray array];
    ALAssetsLibraryGroupsEnumerationResultsBlock resultBlock = ^(ALAssetsGroup *group, BOOL *stop) {
        if (group) {
            if (allPhotos) {
                [group setAssetsFilter:[ALAssetsFilter allPhotos]];
            } else {
                [group setAssetsFilter:[ALAssetsFilter allVideos]];
            }
            // 包装一个模型来赋值
            CDPhotoPickerGroup *pickerGroup = [[CDPhotoPickerGroup alloc] init];
            pickerGroup.group = group;
            pickerGroup.groupName = [group valueForProperty:@"ALAssetsGroupPropertyName"];
            pickerGroup.thumbImage = [UIImage imageWithCGImage:[group posterImage]];
            pickerGroup.assetsCount = [group numberOfAssets];
            if (pickerGroup.assetsCount > 0) {
                [groups addObject:pickerGroup];
            }
        } else {
            callBack(groups);
        }
    };
    NSInteger type = ALAssetsGroupAll;
    [self.library enumerateGroupsWithTypes:type usingBlock:resultBlock failureBlock:nil];
}

/**
 * 获取所有组对应的图片
 */
- (void)getAllGroupWithVideos:(groupCallBackBlock)callBack {
    [self getAllGroupAllPhotos:NO withResource:callBack];
}

#pragma mark -传入一个组获取组里面的Asset
- (void)getGroupPhotosWithGroup:(CDPhotoPickerGroup *)pickerGroup finished:(groupCallBackBlock )callBack {
    
    NSMutableArray *assets = [NSMutableArray array];
    ALAssetsGroupEnumerationResultsBlock result = ^(ALAsset *asset , NSUInteger index , BOOL *stop) {
        if (asset) {
            [assets addObject:asset];
        } else {
            callBack(assets);
        }
    };
    [pickerGroup.group enumerateAssetsUsingBlock:result];
}

#pragma mark -传入一个AssetsURL来获取UIImage
- (void)getAssetsPhotoWithURLs:(NSURL *)url callBack:(groupCallBackBlock )callBack {
    [self.library assetForURL:url resultBlock:^(ALAsset *asset) {
        dispatch_async(dispatch_get_main_queue(), ^{
            callBack([UIImage imageWithCGImage:[[asset defaultRepresentation] fullScreenImage]]);
        });
    } failureBlock:nil];
}

@end
