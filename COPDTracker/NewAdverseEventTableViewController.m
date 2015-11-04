//
//  NewAdverseEventTableViewController.m
//  COPDTracker
//
//  Created by Yu Song on 10/23/15.
//  Copyright © 2015 EFA. All rights reserved.
//

#import "NewAdverseEventTableViewController.h"

@interface NewAdverseEventTableViewController ()
{
    //date picker
    UIDatePicker *datePicker;
    UIPickerView *med_picker_view;
    NSArray *side_effects;
    NSMutableArray *adverse_events_arr_for_submit;
}
@end

@implementation NewAdverseEventTableViewController
@synthesize actionSheet;
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpControls];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 5;
}

-(void)updateTextField:(UIDatePicker *)sender{
    self.date.text = [NSString stringWithFormat:@"%@", sender.date];
}

#pragma set up controls
-(void)setUpControls{
    adverse_events_arr_for_submit = [[NSMutableArray alloc] init];
    self.relatedDrug.delegate = self;
    self.eventName.delegate = self;
    self.date.delegate = self;
    datePicker = [[UIDatePicker alloc] init];
    datePicker.datePickerMode = UIDatePickerModeDateAndTime;
    [self.date setInputView:datePicker];
    [datePicker addTarget:self action:@selector(updateTextField:)
         forControlEvents:UIControlEventValueChanged];
    
    //med picker view
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(pickerDoneClicked)];
    [self buildCustomPickerView:med_picker_view withArray:nil withUITextField:self.relatedDrug withDoneButton:doneBtn];
}

- (IBAction)submitButtonAction:(id)sender {
    if (![self globallyValidateUserInputs:@[self.eventName, self.relatedDrug, self.date]]) return;
    [[AFNetwork getAFManager] POST:[SERVER_URL stringByAppendingString:@"adverse_event_reportings"] parameters:@{@"ae": @{@"patient_id": [userDefaults valueForKey:@"patient_id"], @"created_at": self.date.text, @"side_effects": self.eventName.text, @"notes": self.notes.text}, @"drug_name": self.relatedDrug.text, @"patient_id": [userDefaults valueForKey:@"patient_id"]} success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        [self showAlert:@"Success" withMessage:@"Adverse event report success!"];
        [self.navigationController popViewControllerAnimated:YES];
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        [self showAlert:@"Drug cannot be found." withMessage:@"The drug you input does not exist!"];
    }];
}

#pragma text fields delegates
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    if ([textField isEqual:self.relatedDrug])
        self.relatedDrug.text = [userDefaults valueForKey:@"copd_drugs"][0];
    if ([textField isEqual: self.eventName]) {
        if ([side_effects isEqual:[NSNull null]] || side_effects.count == 0) {
//            [self showAlert:@"Cannot find any side effects" withMessage:@"Cannot find any side effects for this drug, maybe that drug does not exist?"];
//            return;
            side_effects = [userDefaults valueForKey:@"side_effects"];
        }
        [self showActionSheet:@"What is your side effect this time?" withArray:side_effects];
    }
}

#pragma Picker view
#pragma custom picker views
-(void)pickerDoneClicked{
    NSLog(@"Done Clicked");
    [self.relatedDrug resignFirstResponder];
    med_picker_view.hidden=YES;
    
    //find the side effects for this drug
    [[AFNetwork getAFManager] GET:[SERVER_URL stringByAppendingString:@"adverse_event_reportings/search_drug"] parameters:@{@"drug_name" : self.relatedDrug.text, @"patient_id": [userDefaults valueForKey:@"patient_id"]} success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSString *res = (NSDictionary *)responseObject[@"side_effects"];
        if ([res isEqual:[NSNull null]]) {
            [self showAlert:@"Cannot find such drug." withMessage:@"The drug you inptu does not exist!"];
            return;
        }
        else side_effects = [res componentsSeparatedByString:@","];
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
    }];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [[userDefaults valueForKey:@"copd_drugs"] count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [[userDefaults valueForKey:@"copd_drugs"] objectAtIndex:row];
}

- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    self.relatedDrug.text = [[userDefaults valueForKey:@"copd_drugs"] objectAtIndex:row];
}

#pragma ActionSheet
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex >= [side_effects count]) {
        [actionSheet dismissWithClickedButtonIndex:4 animated:YES];
        return;
    }
    //handle the final array that for submitting
    [adverse_events_arr_for_submit addObject: side_effects[buttonIndex]];
    NSArray *uniq_adverse_events_arr = _.array(adverse_events_arr_for_submit).uniq.unwrap;
    self.eventName.text = [uniq_adverse_events_arr componentsJoinedByString:@","];
}

-(void)showActionSheet: (NSString *)title withArray: (NSArray *)array{
    actionSheet = [[UIActionSheet alloc] initWithTitle: title
                                              delegate:self
                                     cancelButtonTitle:nil
                                destructiveButtonTitle:nil
                                     otherButtonTitles:nil];
    for (NSString *title in array)
        [actionSheet addButtonWithTitle:title];
    actionSheet.cancelButtonIndex = [actionSheet addButtonWithTitle:@"Cancel"];
    [actionSheet showInView:self.view];
}
@end
