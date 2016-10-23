//
//  ViewController.m
//  TestButton
//
//  Created by JeLon_Cai on 2016/10/23.
//  Copyright © 2016年 JeLon_Cai. All rights reserved.
//

#import "ViewController.h"
#import "JLCountDownButton.h"

#define Margin 40

#define ScreenH [UIScreen mainScreen].bounds.size.height
#define ScreenW [UIScreen mainScreen].bounds.size.width

@interface ViewController ()
{
    JLCountDownButton   *_countDownButton;
}

@property (weak, nonatomic) IBOutlet JLCountDownButton *countBtnXib;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self setupView];
}

/// 纯代码创建
- (void)setupView
{
    CGFloat tipLabelX = 10;
    CGFloat tipLabelY = ScreenH / 2 - Margin * 2;
    CGFloat tipLabelW = Margin * 2;
    CGFloat tipLabelH = Margin;
    UILabel *tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(tipLabelX, tipLabelY, tipLabelW, tipLabelH)];
    tipLabel.text = @"代码添加";
    tipLabel.textColor = [UIColor blueColor];
    [self.view addSubview:tipLabel];
    
    CGFloat countDownButtonX = Margin * 3;
    CGFloat countDownButtonY = tipLabelY;
    CGFloat countDownButtonW = countDownButtonX;
    CGFloat countDownButtonH = Margin;
    _countDownButton = [JLCountDownButton buttonWithType:UIButtonTypeCustom];
    _countDownButton.frame = CGRectMake(countDownButtonX, countDownButtonY, countDownButtonW, countDownButtonH);
    _countDownButton.backgroundColor = [UIColor lightGrayColor];
    [_countDownButton setTitle:@"开始" forState:UIControlStateNormal];
    [self.view addSubview:_countDownButton];
    
    [_countDownButton addToucheHandler:^(JLCountDownButton *countDownButton, NSInteger tag) {
        countDownButton.enabled = NO;
        
        [countDownButton startWithSecond:10];
        
        [countDownButton didChange:^NSString *(JLCountDownButton *countDownButton, int second) {
            NSString *title = [NSString stringWithFormat:@"剩余%d秒",second];
            return title;
        }];
        
        [countDownButton didFinished:^NSString *(JLCountDownButton *countDownButton, int second) {
            countDownButton.enabled = YES;
            return @"点击重新获取";
        }];
    }];
}

/// Xib创建
- (IBAction)countDownXibTouched:(JLCountDownButton *)sender
{
    sender.enabled = NO;
    // button type要 设置为custom 否则会闪动
    [sender startWithSecond:10];
    
    [sender didChange:^NSString *(JLCountDownButton *countDownButton, int second) {
        NSString *title = [NSString stringWithFormat:@"剩余%d秒",second];
        return title;
    }];
    
    [sender didFinished:^NSString *(JLCountDownButton *countDownButton, int second) {
        countDownButton.enabled = YES;
        return @"点击重新获取";
    }];
}

- (IBAction)countDownXibStop:(id)sender
{
    [self.countBtnXib stop];
    [_countDownButton stop];
}

@end
