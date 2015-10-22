//
//  ProvincesInfo.m
//  注册用户信息
//
//  Created by mac-001 on 15/9/24.
//  Copyright (c) 2015年 mac-001. All rights reserved.
//

#import "ProvincesInfo.h"

@implementation ProvincesInfo

- (ProvincesInfo *)initWithDictionary:(NSDictionary *)dict
{
    if(self = [super init])
    {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (ProvincesInfo *)provincesInfoWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}
+ (NSArray *)provincesInfoPlist
{
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"provinces" ofType:@"plist"]];
    NSMutableArray *modeArray = [NSMutableArray array];
    for(NSDictionary *dict in array)
    {
        ProvincesInfo *provincesInfo = [self provincesInfoWithDictionary:dict];
        [modeArray addObject:provincesInfo];
    }
    return modeArray;
}
@end
