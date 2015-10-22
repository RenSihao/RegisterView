//
//  ProvincesInfo.h
//  注册用户信息
//
//  Created by mac-001 on 15/9/24.
//  Copyright (c) 2015年 mac-001. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProvincesInfo : NSObject

@property (nonatomic, copy)   NSString *name;
@property (nonatomic, strong) NSArray  *cities;
- (ProvincesInfo *)initWithDictionary:(NSDictionary *)dict;
+ (ProvincesInfo *)provincesInfoWithDictionary:(NSDictionary *)dict;
+ (NSArray *)provincesInfoPlist;
@end
