//
//  RegisterTableViewCell.h
//  注册用户信息
//
//  Created by mac-001 on 15/9/24.
//  Copyright (c) 2015年 mac-001. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RegisterInfo;


@interface RegisterTableViewCell : UITableViewCell

@property (nonatomic, strong) RegisterInfo  *registerInfo;

+ (instancetype)registerTableViewCellInitWithTableView:(UITableView *)tableView registerInfo:(RegisterInfo *)registerInfo;
@end
