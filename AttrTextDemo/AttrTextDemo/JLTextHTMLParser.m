//
//  JLTextHTMLParser.m
//  AttrTextDemo
//
//  Created by JeLon_Cai on 2016/10/31.
//  Copyright © 2016年 JeLon_Cai. All rights reserved.
//

#import "JLTextHTMLParser.h"
#import "JLParagraphConfig.h"
#import "UIFont+JLText.h"
#import "NSTextAttachment+JLText.h"

@implementation JLTextHTMLParser

+ (NSString *)HTMLFromAttributedString:(NSAttributedString *)attributedString
{
    BOOL isNewParagraph = YES;
    NSMutableString *htmlContent = [NSMutableString string];
    NSRange effectiveRange = NSMakeRange(0, 0);
    while (effectiveRange.location + effectiveRange.length < attributedString.length) {
        NSDictionary *attributes = [attributedString attributesAtIndex:effectiveRange.location effectiveRange:&effectiveRange];
        NSTextAttachment *attachment = attributes[@"NSAttachment"];
        
        if (attachment) {
            switch (attachment.attachmentType) {
                case JLTextAttachmentTypeImage:
                [htmlContent appendString:[NSString stringWithFormat:@"<img src=\"%@\" width=\"100%%\"/>", attachment.userInfo]];
                    break;
                    
                default:
                    break;
            }
        }
        else {
            NSString *text = [[attributedString string] substringWithRange:effectiveRange];
            UIFont *font = attributes[NSFontAttributeName];
            UIColor *fontColor = attributes[@"NSColor"];
            NSString *color = [self hexStringWithColor:fontColor];
            BOOL underline = [attributes[NSUnderlineStyleAttributeName] boolValue];
            
            BOOL isFirst = YES;
            
            NSArray *components = [text componentsSeparatedByString:@"\n"];
            for (NSInteger i = 0; i < components.count; i++) {
                NSString *content = components[i];
                
                if (!isFirst && isNewParagraph) {
                    [htmlContent appendString:@"</p>"];
                    isNewParagraph = YES;
                }
                
                [htmlContent appendString: [self HTMLWithContent:content font:font underline:underline color:color]];
                isFirst = NO;
            }
        }
        effectiveRange = NSMakeRange(effectiveRange.location + effectiveRange.length, 0);
    }
    return [htmlContent copy];
}
+ (NSString *)HTMLWithContent:(NSString *)content font:(UIFont *)font underline:(BOOL)underline color:(NSString *)color {
    
    if (content.length == 0) {
        return @"";
    }
    
    if (font.bold) {
        content = [NSString stringWithFormat:@"<b>%@</b>", content];
    }
    if (font.italic) {
        content = [NSString stringWithFormat:@"<i>%@</i>", content];
    }
    if (underline) {
        content = [NSString stringWithFormat:@"<u>%@</u>", content];
    }
    
    return content;
}

+ (NSString *)hexStringWithColor:(UIColor *)color {
    
    NSString *colorString = [[CIColor colorWithCGColor:color.CGColor] stringRepresentation];
    NSArray *parts = [colorString componentsSeparatedByString:@" "];
    
    NSMutableString *hexString = [NSMutableString stringWithString:@"#"];
    for (int i = 0; i < 3; i ++) {
        [hexString appendString:[NSString stringWithFormat:@"%02X", (int)([parts[i] floatValue] * 255)]];
    }
    return [hexString copy];
}
@end
