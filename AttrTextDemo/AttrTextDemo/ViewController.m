//
//  ViewController.m
//  AttrTextDemo
//
//  Created by JeLon_Cai on 2016/10/31.
//  Copyright © 2016年 JeLon_Cai. All rights reserved.
//

#import "ViewController.h"

#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height
#define Magin 80


@interface ViewController ()

@property (nonatomic, strong) UITextView *attrTextView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.attrTextView = [[UITextView alloc] initWithFrame:CGRectMake(0, 50, ScreenW, 80)];
    
    [self.view addSubview:self.attrTextView];
    
    
}


@end
