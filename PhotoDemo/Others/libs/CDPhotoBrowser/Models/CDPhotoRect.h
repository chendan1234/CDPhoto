//
//  CDPhotoRect.h
//  CDPhotoBrowser
//
//  Created by 陈丹 on 3/8/2019.
//  Copyright (c) 2019年 L&G. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CDPhotoRect : NSObject

+ (CGRect)setMaxMinZoomScalesForCurrentBoundWithImage:(UIImage *)image;

+ (CGRect)setMaxMinZoomScalesForCurrentBoundWithImageView:(UIImageView *)imageView;

@end
