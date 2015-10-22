//
//  FlagView.h
//  注册用户信息
//
//  Created by mac-001 on 15/9/25.
//  Copyright (c) 2015年 mac-001. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CountryInfo;

@interface FlagView : UIView

@property (nonatomic, strong) CountryInfo *countryInfo;
+ (instancetype)flagViewInit:(CountryInfo *)countryInfo;
@end
