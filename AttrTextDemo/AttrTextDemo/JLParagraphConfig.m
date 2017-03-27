//
//  JLParagraphConfig.m
//  AttrTextDemo
//
//  Created by JeLon_Cai on 2016/10/31.
//  Copyright © 2016年 JeLon_Cai. All rights reserved.
//

#import "JLParagraphConfig.h"

NSString * const JLParagraphTypeName = @"JLParagraphType";
NSString * const JLparagraphIndentName = @"JLMParagraphIndent";

@implementation JLParagraphConfig

static CGFloat const kIndentPerLevel = 32.f;
static NSInteger const kMaxIndentLevel = 6;

- (instancetype)init {
    if (self = [super init]) {
        _type = JLParagraphTypeNone;
        _indentLevel = 0;
    }
    return self;
}

- (instancetype)initWithParagraphStyle:(NSParagraphStyle *)paragraphStyle type:(JLParagraphType)type {
    if (self = [super init]) {
        _indentLevel = paragraphStyle.headIndent / kIndentPerLevel;
    }
    return self;
}

- (void)setIndentLevel:(NSInteger)indentLevel {
    if (indentLevel < 0) {
        indentLevel = 0;
    }
    else if (indentLevel > kMaxIndentLevel) {
        indentLevel = kMaxIndentLevel;
    }
    _indentLevel = indentLevel;
}

- (NSParagraphStyle *)paragraphStyle {
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setParagraphStyle:[NSParagraphStyle defaultParagraphStyle]];
    paragraphStyle.headIndent = kIndentPerLevel * self.indentLevel;
    paragraphStyle.firstLineHeadIndent = kIndentPerLevel * self.indentLevel;
    return paragraphStyle;
}
@end
