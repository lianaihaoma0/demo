//
//  UIFont+JLText.m
//  AttrTextDemo
//
//  Created by JeLon_Cai on 2016/10/31.
//  Copyright © 2016年 JeLon_Cai. All rights reserved.
//

#import "UIFont+JLText.h"

@implementation UIFont (JLText)

- (BOOL)bold
{
    return [self.description containsString:@"font-weight: bold"];
}

- (BOOL)italic
{
    // 通过是否包含 matrix 判断斜体
    return (self.fontDescriptor.fontAttributes[@"NSCTFontMatrixAttribute"] != nil);
}

- (float)fontSize
{
    return [self.fontDescriptor.fontAttributes[@"NSFontSizeAttribute"] floatValue];
}

+ (instancetype)jl_fontWithFontSize:(float)fontSize bold:(BOOL)bold italic:(BOOL)italic
{
    UIFont *font = bold ? [UIFont boldSystemFontOfSize:fontSize] : [UIFont systemFontOfSize: fontSize];
    if (italic) {
        CGAffineTransform matrix = CGAffineTransformMake(1, 0, tanf(15 * (CGFloat)M_PI / 180), 1, 0, 0);
        UIFontDescriptor *descriptor = [UIFontDescriptor fontDescriptorWithName:font.fontName matrix:matrix];
        font = [UIFont fontWithDescriptor:descriptor size:fontSize];
    }
    return font;
}
@end
