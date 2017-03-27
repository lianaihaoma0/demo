//
//  NSTextAttachment+JLText.h
//  AttrTextDemo
//
//  Created by JeLon_Cai on 2016/10/31.
//  Copyright © 2016年 JeLon_Cai. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, JLTextAttachmentType) {
    JLTextAttachmentTypeImage,
    JLTextAttachmentTypeCheckBox,
};

@interface NSTextAttachment (JLText)

+ (instancetype)checkBoxAttachment;
+ (instancetype)attachmentWithImage:(UIImage *)image width:(CGFloat)width;

@property (nonatomic, assign) JLTextAttachmentType attachmentType;
@property (nonatomic, strong) id userInfo;

@end
