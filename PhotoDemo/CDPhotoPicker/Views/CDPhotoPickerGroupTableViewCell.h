//
//  CDPickerGroupTableViewCell.h
//  CDPhotoBrowser
//
//  Created by 陈丹 on 3/8/2019.
//  Copyright (c) 2019年 L&G. All rights reserved.

#import <UIKit/UIKit.h>

@class CDPhotoPickerGroup;

@interface CDPhotoPickerGroupTableViewCell : UITableViewCell

/**
 *  赋值xib
 */
@property (nonatomic ,strong) CDPhotoPickerGroup *group;

@end
