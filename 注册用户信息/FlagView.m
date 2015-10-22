//
//  FlagView.m
//  注册用户信息
//
//  Created by mac-001 on 15/9/25.
//  Copyright (c) 2015年 mac-001. All rights reserved.
//

#import "FlagView.h"
#import "CountryInfo.h"

@interface FlagView ()

@property (nonatomic, strong) UIImageView *flagView;
@property (nonatomic, strong) UILabel     *nameLab;
@end
@implementation FlagView

#pragma mark - 接口区域 
+ (instancetype)flagViewInit:(CountryInfo *)countryInfo
{
    FlagView *flagView = [[FlagView alloc] initWithFrame:CGRectMake(0, 0, 375, 30)];
    flagView.countryInfo = countryInfo;
    return flagView;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        [self addSubview:self.flagView];
        [self addSubview:self.nameLab];
    }
    return self;
}
#pragma mark - 延迟加载
//更新数据
- (void)setCountryInfo:(CountryInfo *)countryInfo
{
    _countryInfo = countryInfo;
    
    self.flagView.image = [UIImage imageNamed:self.countryInfo.icon];
    self.nameLab.text = self.countryInfo.name;
}
- (UILabel *)nameLab
{
    if(!_nameLab)
    {
        _nameLab = [[UILabel alloc] initWithFrame:CGRectMake(100, 0, 100, 30)];
        [_nameLab setFont:[UIFont systemFontOfSize:20]];
    }
    return _nameLab;
}
- (UIImageView *)flagView
{
    if(!_flagView)
    {
        _flagView = [[UIImageView alloc] initWithFrame:CGRectMake(200, 0, 100, 30)];
    }
    return _flagView;
}

@end
