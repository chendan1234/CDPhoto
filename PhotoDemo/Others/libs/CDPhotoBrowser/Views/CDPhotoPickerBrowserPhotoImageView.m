//
// CDPhotoPickerBrowserPhotoImageView.m
//  CDPhotoBrowser
//
//  Created by 陈丹 on 3/8/2019.
//  Copyright (c) 2019年 L&G. All rights reserved.

#import "CDPhotoPickerBrowserPhotoImageView.h"

@interface CDPhotoPickerBrowserPhotoImageView ()

@property (nonatomic) UITapGestureRecognizer *scaleBigTap;

@end

@implementation CDPhotoPickerBrowserPhotoImageView

- (id)initWithFrame:(CGRect)frame {
	if ((self = [super initWithFrame:frame])) {
        self.userInteractionEnabled = YES;
        // 监听手势
        [self addGesture];
	}
	return self;
}

- (id)initWithImage:(UIImage *)image {
	if ((self = [super initWithImage:image])) {
        self.userInteractionEnabled = YES;
        // 监听手势
        [self addGesture];
	}
	return self;
}

- (id)initWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage {
	if ((self = [super initWithImage:image highlightedImage:highlightedImage])) {
        self.userInteractionEnabled = YES;
        // 监听手势
        [self addGesture];
	}
	return self;
}


#pragma mark -监听手势
- (void)addGesture {
    self.contentMode = UIViewContentModeScaleAspectFit;
    // 双击放大
    UITapGestureRecognizer *scaleBigTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTap:)];
    scaleBigTap.numberOfTapsRequired = 2;
    scaleBigTap.numberOfTouchesRequired = 1;
    [self addGestureRecognizer:_scaleBigTap = scaleBigTap];

    // 单击缩小
    UITapGestureRecognizer *disMissTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    disMissTap.numberOfTapsRequired = 1;
    disMissTap.numberOfTouchesRequired = 1;
    [self addGestureRecognizer:disMissTap];
    // 只能有一个手势存在
    [disMissTap requireGestureRecognizerToFail:scaleBigTap];
}

- (void)addScaleBigTap {
    [self.scaleBigTap addTarget:self action:@selector(handleDoubleTap:)];
}

- (void)removeScaleBigTap {
    [self.scaleBigTap removeTarget:self action:@selector(handleDoubleTap:)];
}

- (void)handleSingleTap:(UITouch *)touch {
	if ([_tapDelegate respondsToSelector:@selector(imageView:singleTapDetected:)])
		[_tapDelegate imageView:self singleTapDetected:touch];
}

- (void)handleDoubleTap:(UITouch *)touch {
	if ([_tapDelegate respondsToSelector:@selector(imageView:doubleTapDetected:)])
		[_tapDelegate imageView:self doubleTapDetected:touch];
}

@end
