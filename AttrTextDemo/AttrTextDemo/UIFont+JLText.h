//
//  UIFont+JLText.h
//  AttrTextDemo
//
//  Created by JeLon_Cai on 2016/10/31.
//  Copyright © 2016年 JeLon_Cai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (JLText)

@property (nonatomic, readonly) BOOL bold;
@property (nonatomic, readonly) BOOL italic;
@property (nonatomic, readonly) float fontSize;

+ (instancetype)jl_fontWithFontSize:(float)fontSize bold:(BOOL)bold italic:(BOOL)italic;

@end
