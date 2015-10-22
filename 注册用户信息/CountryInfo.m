//
//  CountryInfo.m
//  注册用户信息
//
//  Created by mac-001 on 15/9/24.
//  Copyright (c) 2015年 mac-001. All rights reserved.
//

#import "CountryInfo.h"

@implementation CountryInfo
- (CountryInfo *)initWithDictionary:(NSDictionary *)dict
{
    if(self = [super init])
    {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (CountryInfo *)countryInfoWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}
+ (NSArray *)countryInfoPlist
{
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"flags" ofType:@"plist"]];
    NSMutableArray *modeArray = [NSMutableArray array];
    for(NSDictionary *dict in array)
    {
        CountryInfo *countryInfo = [self countryInfoWithDictionary:dict];
        [modeArray addObject:countryInfo];
    }
    return modeArray;
}
@end
