//
//  ViewController.m
//  MVVMTest
//
//  Created by JeLon_Cai on 2016/10/23.
//  Copyright © 2016年 JeLon_Cai. All rights reserved.
//

#import "ViewController.h"
#import "ViewModel.h"

#define Margin 40
#define ScreenW [UIScreen mainScreen].bounds.size.width

@interface ViewController ()
{
    UITextView      *_showTextView;
}

@property (nonatomic, strong)ViewModel *viewModel;

@end

@implementation ViewController

#pragma mark - Getter
- (ViewModel *)viewModel
{
    if (_viewModel == nil)
    {
        _viewModel = [[ViewModel alloc] init];
    }
    return _viewModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpView];
    [self setupKVO];
    [self.viewModel getImagesList];
}

- (void)setUpView
{
    CGFloat preButtonX = Margin;
    CGFloat preButtonY = Margin;
    CGFloat preButtonW = Margin * 3;
    CGFloat preButtonH = preButtonX;
    UIButton *preButton = [[UIButton alloc] initWithFrame:CGRectMake(preButtonX, preButtonY, preButtonW, preButtonH)];
    [preButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [preButton setTitle:@"Pre" forState:UIControlStateNormal];
    [preButton addTarget:self action:@selector(getPre) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:preButton];
    
    CGFloat nextButtonX = Margin;
    CGFloat nextButtonY = Margin * 3;
    CGFloat nextButtonW = preButtonW;
    CGFloat nextButtonH = nextButtonX;
    UIButton *nextButton = [[UIButton alloc] initWithFrame:CGRectMake(nextButtonX, nextButtonY, nextButtonW, nextButtonH)];
    [nextButton setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
    [nextButton setTitle:@"Next" forState:UIControlStateNormal];
    [nextButton addTarget:self action:@selector(getNext) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextButton];
    
    _showTextView = [[UITextView alloc] initWithFrame:CGRectMake(0, Margin * 5, ScreenW, Margin * 5)];
    _showTextView.backgroundColor = [UIColor lightGrayColor];
    _showTextView.textColor = [UIColor redColor];
    [self.view addSubview:_showTextView];
    
}

- (void)getPre
{
    [self.viewModel getPreIamgesList];
}

- (void)getNext
{
    [self.viewModel getNextImagesList];
}

- (void)dealloc
{
    [self removeKVO];
}

#pragma mark - KVO
- (void)setupKVO
{
    [self.viewModel addObserver:self forKeyPath:@"racMsg" options:(NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld) context:nil];
}

- (void)removeKVO
{
    [self.viewModel removeObserver:self forKeyPath:@"racMsg"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"racMsg"]) {
        if ([self.viewModel.racMsg isEqualToString:@"success"])
        {
            _showTextView.text = [NSString stringWithFormat:@"%@",_viewModel.data];
        }
        else{
            _showTextView.text = @"error";
        }
    }
}
@end
