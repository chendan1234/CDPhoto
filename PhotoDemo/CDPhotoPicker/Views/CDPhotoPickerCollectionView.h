//
//  CDPickerCollectionView.h
//  CDPhotoBrowser
//
//  Created by 陈丹 on 3/8/2019.
//  Copyright (c) 2019年 L&G. All rights reserved.

#import <UIKit/UIKit.h>
#import "CDPhotoAssets.h"

// 展示状态
typedef NS_ENUM(NSUInteger, CDPickerCollectionViewShowOrderStatus) {
    CDPickerCollectionViewShowOrderStatusTimeDesc = 0, // 升序
    CDPickerCollectionViewShowOrderStatusTimeAsc // 降序
};

@class CDPhotoPickerCollectionView;

@protocol CDPhotoPickerCollectionViewDelegate <NSObject>

@optional
// 选择相片就会调用
- (void)pickerCollectionViewDidSelected:(CDPhotoPickerCollectionView *)pickerCollectionView deleteAsset:(CDPhotoAssets *)deleteAssets;

//点击cell会调用
- (void)pickerCollectionCellTouchedIndexPath:(NSIndexPath *)indexPath;

// 点击拍照就会调用
- (void)pickerCollectionViewDidCameraSelect:(CDPhotoPickerCollectionView *)pickerCollectionView;

@end

@interface CDPhotoPickerCollectionView:UICollectionView<UICollectionViewDelegate>

// scrollView滚动的升序降序
@property (nonatomic, assign) CDPickerCollectionViewShowOrderStatus status;
// 保存所有的数据
@property (nonatomic) NSArray<__kindof CDPhotoAssets*> *dataArray;
// 保存选中的图片
@property (nonatomic) NSMutableArray<__kindof CDPhotoAssets*> *selectAssets;
// 最后保存的一次图片
@property (nonatomic) NSMutableArray *lastDataArray;
// delegate
@property (nonatomic, weak) id <CDPhotoPickerCollectionViewDelegate> collectionViewDelegate;
// 限制最大数
@property (nonatomic, assign) NSInteger maxCount;
// 置顶展示图片
@property (nonatomic, assign) BOOL topShowPhotoPicker;
// 记录选中的值
@property (nonatomic, assign) BOOL isRecoderSelectPicker;

@end
