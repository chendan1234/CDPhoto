//
//  CDPickerImageView.m
//  CDPhotoBrowser
//
//  Created by 陈丹 on 3/8/2019.
//  Copyright (c) 2019年 L&G. All rights reserved.

#import "CDPhotoPickerImageView.h"

@interface CDPhotoPickerImageView ()

@property (nonatomic) UIView      *maskView;
@property (nonatomic) UIImageView *tickImageView;
@property (nonatomic) UIImageView *videoView;

@end

@implementation CDPhotoPickerImageView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.contentMode = UIViewContentModeScaleAspectFill;
        self.clipsToBounds = YES;
    }
    return self;
}

- (UIView *)maskView {
    if (!_maskView) {
        UIView *maskView = [[UIView alloc] init];
        maskView.frame = self.bounds;
        maskView.backgroundColor = [UIColor whiteColor];
        maskView.alpha = 0.5;
        [self addSubview:maskView];
        self.maskView = maskView;
    }
    return _maskView;
}

//- (UIImageView *)videoView{
//    if (!_videoView) {
//        UIImageView *videoView = [[UIImageView alloc] initWithFrame:CGRectMake(10, self.bounds.size.height - 40, 30, 30)];
//        videoView.image = [UIImage ml_imageFromBundleNamed:@"video"];
//        videoView.contentMode = UIViewContentModeScaleAspectFit;
//        [self addSubview:videoView];
//        self.videoView = videoView;
//    }
//    return _videoView;
//}

- (UIImageView *)tickImageView {
    if (!_tickImageView) {
        UIImageView *tickImageView = [[UIImageView alloc] init];
        tickImageView.frame = CGRectMake(self.bounds.size.width - 28, 5, 21, 21);
        tickImageView.image = [UIImage imageNamed:@"checkbox_pic_non"];
        [self addSubview:tickImageView];
        self.tickImageView = tickImageView;
    }
    return _tickImageView;
}

- (void)setIsVideoType:(BOOL)isVideoType {
    _isVideoType = isVideoType;
    self.videoView.hidden = !(isVideoType);
}

- (void)setMaskViewFlag:(BOOL)maskViewFlag {
    _maskViewFlag = maskViewFlag;
    
    if (!maskViewFlag) {
        // hidden
        [self.tickImageView setImage:[UIImage imageNamed:@"checkbox_pic_non"]];
    }else{
        [self.tickImageView setImage:[UIImage imageNamed:@"checkbox_pic"]];
    }
    self.animationRightTick = maskViewFlag;
}

- (void)setMaskViewColor:(UIColor *)maskViewColor {
    _maskViewColor = maskViewColor;
    self.maskView.backgroundColor = maskViewColor;
}

- (void)setMaskViewAlpha:(CGFloat)maskViewAlpha {
    _maskViewAlpha = maskViewAlpha;
    self.maskView.alpha = maskViewAlpha;
}

- (void)setAnimationRightTick:(BOOL)animationRightTick {
    _animationRightTick = animationRightTick;
}
@end
