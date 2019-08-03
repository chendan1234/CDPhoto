//
//  BQImageView.h
//  BQCommunity
//
//  Created by 陈丹 on 3/8/2019.
//  Copyright (c) 2019年 beiqing. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZLCameraImageView;

@protocol ZLCameraImageViewDelegate <NSObject>

@optional
/**
 *  根据index来删除照片
 */
- (void)deleteImageView:(ZLCameraImageView *) imageView;

@end

@interface ZLCameraImageView : UIImageView

@property (nonatomic, weak) id <ZLCameraImageViewDelegate> delegatge;
/**
 *  是否是编辑模式 , YES 代表是
 */
@property (nonatomic, assign, getter = isEdit) BOOL edit;


@end
