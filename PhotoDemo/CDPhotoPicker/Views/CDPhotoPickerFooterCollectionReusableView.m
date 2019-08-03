//
//  CDFooterCollectionReusableView.m
//  CDPhotoBrowser
//
//  Created by 陈丹 on 3/8/2019.
//  Copyright (c) 2019年 L&G. All rights reserved.

#import "CDPhotoPickerFooterCollectionReusableView.h"

@interface CDPhotoPickerFooterCollectionReusableView ()

@property (nonatomic, weak) UILabel *footerLabel;

@end

@implementation CDPhotoPickerFooterCollectionReusableView

- (UILabel *)footerLabel {
    if (!_footerLabel) {
        UILabel *footerLabel = [[UILabel alloc] init];
        footerLabel.frame = self.bounds;
        footerLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:footerLabel];
        self.footerLabel = footerLabel;
    }
    return _footerLabel;
}

- (void)setCount:(NSInteger)count {
    _count = count;
    
    if (count > 0) {
        self.footerLabel.text = [NSString stringWithFormat:@"有 %ld 张图片", (long)count];
    }
}

@end
