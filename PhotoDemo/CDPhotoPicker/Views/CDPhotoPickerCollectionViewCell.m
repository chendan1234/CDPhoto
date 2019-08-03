//
//  CDPickerCollectionViewCell.m
//  CDPhotoBrowser
//
//  Created by 陈丹 on 3/8/2019.
//  Copyright (c) 2019年 L&G. All rights reserved.

#import "CDPhotoPickerCollectionViewCell.h"

static NSString *const _cellIdentifier = @"cell";

@implementation CDPhotoPickerCollectionViewCell

+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CDPhotoPickerCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:_cellIdentifier forIndexPath:indexPath];

//    [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)]; //耗时较长
    
    return cell;
}
@end
