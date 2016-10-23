//
//  JLCountDownButton.h
//  TestButton
//
//  Created by JeLon_Cai on 2016/10/23.
//  Copyright © 2016年 JeLon_Cai. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JLCountDownButton;
typedef NSString* (^DidChangeBlock)(JLCountDownButton *countDownButton, int second);
typedef NSString* (^DidFinishedBlock)(JLCountDownButton *countDownButton, int second);
typedef void (^TouchedDownBlock)(JLCountDownButton *countDownButton, NSInteger tag);

@interface JLCountDownButton : UIButton
{
    int _second;
    int _totalSecond;
    
    NSTimer *_timer;
    DidChangeBlock _didChangeBlock;
    DidFinishedBlock _didFinishedBlock;
    TouchedDownBlock _touchedDownBlock;
}

- (void)addToucheHandler:(TouchedDownBlock)touchHandler;

- (void)didChange:(DidChangeBlock)didChangeBlock;
- (void)didFinished:(DidFinishedBlock)didFinishedBlock;
- (void)startWithSecond:(int)totalSecond;
- (void)stop;
@end
