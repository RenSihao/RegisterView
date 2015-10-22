//
//  RegisterInfo.h
//  注册用户信息
//
//  Created by mac-001 on 15/9/24.
//  Copyright (c) 2015年 mac-001. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegisterInfo : NSObject

@property (nonatomic, copy) NSString *title;
- (RegisterInfo *)initWithDictionary:(NSDictionary *)dict;
+ (RegisterInfo *)registerInfoWithDictionary:(NSDictionary *)dict;
+ (NSArray *)registerInfoPlist;
@end
