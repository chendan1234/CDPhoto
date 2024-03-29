//
//  BQImageView.m
//  BQCommunity
//
//  Created by 陈丹 on 3/8/2019.
//  Copyright (c) 2019年 beiqing. All rights reserved.
//

#import "ZLCameraImageView.h"
//#import "UIImage+ZLPhotoLib.h"

@interface ZLCameraImageView ()

@property (nonatomic) UIImageView *deleBjView;

@end

@implementation ZLCameraImageView

- (UIImageView *)deleBjView {
    if (!_deleBjView) {
        _deleBjView = [[UIImageView alloc] init];
        _deleBjView.image = [UIImage imageNamed:@"X.png"];
        _deleBjView.frame = CGRectMake(50, 0, 25, 25);
        _deleBjView.hidden = YES;
        _deleBjView.userInteractionEnabled = YES;
        [_deleBjView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(deleImage:)]];
        [self addSubview:_deleBjView];
    }
    return _deleBjView;
}

- (void)setEdit:(BOOL)edit {
    self.deleBjView.hidden = NO;
}

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
    }
    return self;
}

#pragma mark 删除图片
- (void)deleImage:( UITapGestureRecognizer *)tap {
    if ([self.delegatge respondsToSelector:@selector(deleteImageView:)]) {
        [self.delegatge deleteImageView:self];
    }
}

@end
