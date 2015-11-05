//
//  NewExacerbationTableViewController.m
//  COPDTracker
//
//  Created by Yu Song on 10/29/15.
//  Copyright © 2015 EFA. All rights reserved.
//

#import "NewExacerbationTableViewController.h"

@interface NewExacerbationTableViewController ()
{
    UIDatePicker *start_date_picker;
    UIDatePicker *end_date_picker;
    UIPickerView *intensidy_picker;
    NSArray *intensity_arr;
}
@end

@implementation NewExacerbationTableViewController
@synthesize excerbationTypes;
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

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"excerbation_types"]) {
        self.excerbationTypes = (ExcerbationTypesTable *)segue.destinationViewController;
        self.excerbationTypes.parent = self;
    }
}


- (IBAction)submitAction:(id)sender {
    if (![self globallyValidateUserInputs:@[self.start_date, self.end_date, self.symptom, self.intensity]])
        return;
    [[AFNetwork getAFManager] POST:[SERVER_URL stringByAppendingString:@"excerbations"] parameters:@{@"excerbation": @{@"patient_id" : [userDefaults valueForKey:@"patient_id"], @"start_date": self.start_date.text, @"end_date": self.end_date.text, @"symptom": self.symptom.text, @"intensity": self.intensity.text}} success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        [self showAlert:@"Add excerbation success!" withMessage:@"Excerbation added!"];
        [self.navigationController popViewControllerAnimated:YES];
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        NSLog(@"error: %@", [error description]);
    }];
}

#pragma init controls
-(void)setUpControls{
    self.start_date.delegate = self;
    self.end_date.delegate = self;
    self.intensity.delegate = self;
    intensity_arr = @[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10"];
    start_date_picker = [[UIDatePicker alloc] init];
    [start_date_picker addTarget:self action:@selector(updateStartDate:) forControlEvents:UIControlEventValueChanged];
    end_date_picker = [[UIDatePicker alloc] init];
    [end_date_picker addTarget:self action:@selector(updateEndDate:) forControlEvents:UIControlEventValueChanged];
    [self buildDateTimePickerView:start_date_picker withNSDate:[NSDate date] withUITextField:self.start_date withDatePickerMode: UIDatePickerModeDateAndTime];
    [self buildDateTimePickerView:end_date_picker withNSDate:[NSDate date] withUITextField:self.end_date withDatePickerMode: UIDatePickerModeDateAndTime];
    
    //picker view
    //med picker view
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(intensityDoneClicked)];
    [self buildCustomPickerView:intensidy_picker withArray:nil withUITextField:self.intensity withDoneButton:doneBtn];
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    if ([textField isEqual:self.start_date] || [textField isEqual: self.end_date])
        textField.text = [NSString stringWithFormat:@"%@", [NSDate date]];
    if ([textField isEqual: self.intensity]) {
        textField.text = intensity_arr[0];
    }
}

#pragma picker views
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [intensity_arr count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [intensity_arr objectAtIndex:row];
    
}

- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    self.intensity.text = [intensity_arr objectAtIndex:row];
}

-(void)intensityDoneClicked{
    [self.intensity resignFirstResponder];
    intensidy_picker.hidden = YES;
}

-(void)updateStartDate: (id)sender{
    self.start_date.text = [NSString stringWithFormat:@"%@", [(UIDatePicker *)self.start_date.inputView date]];
}

-(void)updateEndDate: (id)sender{
    self.end_date.text = [NSString stringWithFormat:@"%@", [(UIDatePicker *)self.end_date.inputView date]];
}
@end
