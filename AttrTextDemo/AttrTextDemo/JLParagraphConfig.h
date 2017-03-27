//
//  JLParagraphConfig.h
//  AttrTextDemo
//
//  Created by JeLon_Cai on 2016/10/31.
//  Copyright © 2016年 JeLon_Cai. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString * const JLParagraphTypeName;
extern NSString * const JLParagraphIndentName;

typedef NS_ENUM(NSInteger, JLParagraphType) {
    JLParagraphTypeNone = 0,
    JLParagraphTypeList,
    JLParagraphTypeNumberList,
    JLParagraphTypeCheckbox
};

@interface JLParagraphConfig : NSObject

@property (nonatomic, assign) JLParagraphType type;
@property (nonatomic, assign) NSInteger indentLevel;

@property (nonatomic, readonly) NSParagraphStyle *paragraphStyle;

- (instancetype)initWithParagraphStyle:(NSParagraphStyle *)paragraphStyle type:(JLParagraphType)type;

@end
