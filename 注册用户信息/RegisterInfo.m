//
//  RegisterInfo.m
//  注册用户信息
//
//  Created by mac-001 on 15/9/24.
//  Copyright (c) 2015年 mac-001. All rights reserved.
//

#import "RegisterInfo.h"

@implementation RegisterInfo

- (RegisterInfo *)initWithDictionary:(NSDictionary *)dict
{
    if(self = [super init])
    {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (RegisterInfo *)registerInfoWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}
+ (NSArray *)registerInfoPlist
{
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Register" ofType:@"plist"]];
    NSMutableArray *modeArray = [NSMutableArray array];
    for(NSDictionary *dict in array)
    {
        RegisterInfo *registerInfo = [self registerInfoWithDictionary:dict];
        [modeArray addObject:registerInfo];
    }
    return modeArray;
}
@end
