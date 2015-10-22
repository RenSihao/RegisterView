//
//  RegisterTableViewCell.m
//  注册用户信息
//
//  Created by mac-001 on 15/9/24.
//  Copyright (c) 2015年 mac-001. All rights reserved.
//

#import "RegisterTableViewCell.h"
#import "RegisterInfo.h"
#import "ProvincesInfo.h"
#import "CountryInfo.h"
#import "FlagView.h"

#define MARGIN     5
#define LAB_WIDTH  60
#define LAB_HEIGHT 30
#define TF_WIDTH   300
#define TF_HEIGHT  30

@interface RegisterTableViewCell () <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, strong) UILabel     *titleLab;
@property (nonatomic, strong) UITextField *inputTF;

@property (nonatomic, strong) UIDatePicker *birthDatePicker;
@property (nonatomic, strong) UIPickerView *provincesPicker;
@property (nonatomic, strong) UIPickerView *countryPicker;

@property (nonatomic, strong) NSArray *provincesInfoPlist;
@property (nonatomic, strong) NSArray *countryInfoPlist;

@property (nonatomic, assign) NSInteger  index;

@end

@implementation RegisterTableViewCell

#pragma mark - RegisterTableViewCell类 接口区域
+ (instancetype)registerTableViewCellInitWithTableView:(UITableView *)tableView registerInfo:(RegisterInfo *)registerInfo
{
    RegisterTableViewCell *cell = [[RegisterTableViewCell alloc] init];
    cell.registerInfo = registerInfo;
    [cell setBackgroundColor:[UIColor colorWithRed:0.2 green:0.6 blue:0.8 alpha:1]];
    return cell;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self addSubview:self.nameLab];
        [self addSubview:self.inputTF];
    }
    return self;
}
#pragma mark - 更新数据区域
- (void)setRegisterInfo:(RegisterInfo *)registerInfo
{
    _registerInfo = registerInfo;
    
    [self.nameLab setText:_registerInfo.title];
    if([_registerInfo.title isEqualToString:@"用户名"])
    {
        [self.inputTF setKeyboardType:UIKeyboardTypeDefault];
    }
    else if([_registerInfo.title isEqualToString:@"密码"])
    {
        [self.inputTF setKeyboardType:UIKeyboardTypeDefault];
    }
    else if([_registerInfo.title isEqualToString:@"邮箱"])
    {
        [self.inputTF setKeyboardType:UIKeyboardTypeEmailAddress];
    }
    else if([_registerInfo.title isEqualToString:@"手机"])
    {
        [self.inputTF setKeyboardType:UIKeyboardTypeNumberPad];
    }
    else if([_registerInfo.title isEqualToString:@"生日"])
    {
        [self.inputTF setInputView:self.birthDatePicker];
    }
    else if([_registerInfo.title isEqualToString:@"国籍"])
    {
        [self.inputTF setInputView:self.countryPicker];
    }
    else if([_registerInfo.title isEqualToString:@"所在省市"])
    {
        [self.inputTF setInputView:self.provincesPicker];
    }
    
    UIToolbar *itemBar = [[UIToolbar alloc] init];
    UIBarButtonItem *previousItem = [[UIBarButtonItem alloc] initWithTitle:@"previous" style:UIBarButtonItemStyleDone target:self action:nil];
    UIBarButtonItem *nextItem = [[UIBarButtonItem alloc] initWithTitle:@"next" style:UIBarButtonItemStyleDone target:self action:nil];
    UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:nil];
    UIBarButtonItem *flexItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *fixItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fixItem.width = 30;
    itemBar.items = @[previousItem, fixItem, nextItem, flexItem, doneItem];
    [self.inputTF setInputAccessoryView:itemBar];
    
    
}
#pragma mark - RegisterTableViewCell类 子控件延迟加载区域
- (UILabel *)nameLab
{
    if(!_titleLab)
    {
        _titleLab = [[UILabel alloc] initWithFrame:
                    CGRectMake(MARGIN, MARGIN, LAB_WIDTH, LAB_HEIGHT)];
        [_titleLab setFont:[UIFont systemFontOfSize:15.0f]];
        [_titleLab setTextAlignment:NSTextAlignmentLeft];
        [_titleLab setTextColor:[UIColor blackColor]];
        [_titleLab setBackgroundColor:[UIColor redColor]];
        
    }
    return _titleLab;
}
- (UITextField *)inputTF
{
    if(!_inputTF)
    {
        _inputTF = [[UITextField alloc] initWithFrame:CGRectMake(MARGIN + CGRectGetMaxX(self.titleLab.frame), MARGIN, TF_WIDTH, TF_HEIGHT)];
        [_inputTF setBorderStyle:UITextBorderStyleLine];
        [_inputTF setReturnKeyType:UIReturnKeyDone];
        [_inputTF setEnablesReturnKeyAutomatically:YES];
    }
    return _inputTF;
}
- (UIDatePicker *)birthDatePicker
{
    if(!_birthDatePicker)
    {
        _birthDatePicker = [[UIDatePicker alloc] init];
        _birthDatePicker.datePickerMode = UIDatePickerModeDate;
        _birthDatePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
    }
    return _birthDatePicker;
}
- (UIPickerView *)provincesPicker
{
    if(!_provincesPicker)
    {
        _provincesPicker = [[UIPickerView alloc] init];
        _provincesPicker.delegate   = self;
        _provincesPicker.dataSource = self;
    }
    return _provincesPicker;
}
- (UIPickerView *)countryPicker
{
    if(!_countryPicker)
    {
        _countryPicker = [[UIPickerView alloc] init];
        _countryPicker.delegate   = self;
        _countryPicker.dataSource = self;
    }
    return _countryPicker;
}
// 数据模型
- (NSArray *)provincesInfoPlist
{
    if(!_provincesInfoPlist)
    {
        _provincesInfoPlist = [ProvincesInfo provincesInfoPlist];
    }
    return _provincesInfoPlist;
}
- (NSArray *)countryInfoPlist
{
    if(!_countryInfoPlist)
    {
        _countryInfoPlist = [CountryInfo countryInfoPlist];
    }
    return _countryInfoPlist;
}
#pragma mark - UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    if(pickerView == self.provincesPicker)
    {
        return 2;
    }
    else if(pickerView == self.countryPicker)
    {
        return 1;
    }
    return 0;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if(pickerView == self.provincesPicker)
    {
        if(component == 0)
        {
            return self.provincesInfoPlist.count;
        }
        else
        {
            return [self.provincesInfoPlist[self.index] cities].count;
        }
    }
    else if(pickerView == self.countryPicker)
    {
        return self.countryInfoPlist.count;
    }
    return 0;
}
#pragma mark - UIPickerViewDelegate
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    if(pickerView == self.countryPicker)
    {
        return 375;
    }
    else if(pickerView == self.provincesPicker)
    {
        return 375/2;
    }
    return 0;
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    if(pickerView == self.countryPicker)
    {
        return 30;
    }
    else if(pickerView == self.provincesPicker)
    {
        return 30;
    }
    return 0;
}
-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    if(pickerView == self.provincesPicker)
    {
        UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
        [lab setFont:[UIFont systemFontOfSize:20]];
        if(component == 0)
        {
            lab.text = [self.provincesInfoPlist[row] name];
        }
        else
        {
            lab.text = [self.provincesInfoPlist[self.index] cities][row];
        }
        return  lab;
    }
    if(pickerView == self.countryPicker)
    {
        FlagView *flagView = [FlagView flagViewInit:self.countryInfoPlist[row]];
        return flagView;
    }
    return nil;
        
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if(pickerView == self.provincesPicker)
    {
        if(component == 0)
        {
            self.index = row;
            [self.provincesPicker reloadComponent:1];
            [self.provincesPicker selectRow:0 inComponent:1 animated:YES];
        }
        else
        {
            
        }
    }
    if(pickerView == self.countryPicker)
    {
        
    }
}

#pragma mark - RegisterTableViewCell类 加载启动
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self endEditing:YES];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
