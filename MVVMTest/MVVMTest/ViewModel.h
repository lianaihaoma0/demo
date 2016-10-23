//
//  ViewModel.h
//  MVVMTest
//
//  Created by JeLon_Cai on 2016/10/23.
//  Copyright © 2016年 JeLon_Cai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ViewModel : NSObject

@property (nonatomic, strong) NSDictionary *data;
@property (nonatomic, strong) NSString *racMsg;

- (void)getImagesList;
- (void)getNextImagesList;
- (void)getPreIamgesList;

@end
