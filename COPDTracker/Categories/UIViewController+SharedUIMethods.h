//
//  UIViewController+SharedUIMethods.h
//  TrackPacker
//
//  Created by Yu Song on 7/21/15.
//  Copyright (c) 2015 TrackPacker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetwork.h"
#import "Constants.h"
#import "Manifest.h"
@import Charts;

@interface UIViewController (SharedUIMethods)

-(void)showAlert: (NSString *)title withMessage: (NSString *)msg;

//trim whitespace
-(NSString *)trim: (NSString *)str;
//check whether is number
-(BOOL)isNnumber: (NSString *)input;
//clear all the inputs fields
-(void)clearAllTextFields: (NSArray *)text_fields;

-(BOOL)globallyValidateUserInputs:(NSArray *)inputs;

//get the all formated date by appending only time, the format is yyyy-MM-dd HH:mm:ss
-(NSDate *)getEntireFormattedDateByAppendingTime: (NSString *)time;

//gloabally schedule 1 reminder
-(void)scheduleReminder: (NSString *)msg withAlertSound: (NSString *)soundName withTime: (NSString *)time;

//globally schedule multiple reminders
-(void)scheduleReminders: (NSString *)days withTimes: (NSArray *)times_arr withDrugName: (NSString *)drug_name;

//schedule all the Rx related reminders once the user is login.
-(void)scheduleRxReminders: (NSString *)patient_id;

-(UIView *)setLeftViewForTextfields:(NSString *)imageName withContainerScale:(int)containerScale withImageIconScale:(int)imageScale withUITextField:(UITextField *)textfield;

//display and style only for the drug image
-(void)displayAndStyleDrugImage: (id)imageUrl withImageView: (UIImageView *)imageView withImageKeyName: (NSString *)key;

//set scroll view for all kinds of devices
-(void)setScrollViewSiseForAllKindsOfDevices: (UIScrollView *)scrollView withView: (UIView *)view;

-(void)setOneViewCenterAlign: (UIView *)view withParentView: (UIView *)parentView;

-(void)setAllViewCenterAlign: (NSArray *)views withParentView: (UIView *)parentView;

-(NSArray *)getUITextfieldTextInArray: (NSMutableArray *)textFields;

-(UIView *)getUIViewByTagFromArray: (int)tag withArray: (NSMutableArray *)array;

-(void)buildCustomPickerView: (UIPickerView *)pickerView withArray: (NSArray *)arr withUITextField: (UITextField *)textField withDoneButton: (UIBarButtonItem *)doneButton;

-(void)buildDateTimePickerView: (UIDatePicker *)datePicker withNSDate: (NSDate *)date withUITextField: (UITextField *)textField withDatePickerMode: (UIDatePickerMode *)mode;

-(NSString *)showNullIfNull: (NSString *)str;
-(NSString *)showNullIfNullWithPrefix: (NSString *)str withPrefix: (NSString *)prefix;

-(NSString *)convertBOOL: (UISwitch *)switcher;

-(void)getSelf;
@end
