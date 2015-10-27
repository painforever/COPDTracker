//
//  ScheduleTableViewController.m
//  COPDTracker
//
//  Created by Yu Song on 10/26/15.
//  Copyright © 2015 EFA. All rights reserved.
//

#import "ScheduleTableViewController.h"

@interface ScheduleTableViewController ()
{
    NSArray *displayedArr;
}
@end

@implementation ScheduleTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.date_enum = @{@"Repeat everyday": @"0", @"Repeat every Monday": @"1", @"Repeat every Tuesday": @"2", @"Repeat every Wednsday": @"3", @"Repeat every Thursday": @"4", @"Repeat every Friday": @"5", @"Repeat every Saturday":@"6", @"Repeat every Sunday":@"7"};
    displayedArr = [self.date_enum allKeys];
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(pickerDoneClicked)];
    [self buildCustomPickerView:self.schedulePicker withArray:nil withUITextField:self.schedule withDoneButton:doneBtn];
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
    return 3;
}

#pragma UIPickerView
-(void)pickerDoneClicked{
    NSLog(@"Done Clicked");
    [self.schedule resignFirstResponder];
    //mypickerToolbar.hidden=YES;
    self.schedulePicker.hidden=YES;
    NSLog(@"selected %@", self.date_enum[self.schedule.text]);
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [self.date_enum count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [displayedArr objectAtIndex:row];
}

- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    self.schedule.text = [displayedArr objectAtIndex:row];
}

- (IBAction)submitAction:(id)sender {
    NSLog(@"asas %@ %@", self.schedule.text, self.repeat.text);
    self.parent.schedule_result_label.text = [NSString stringWithFormat:@"%@ for %@ time(s)", self.schedule.text, self.repeat.text];
    self.parent.scheduled_time = self.schedule.text;
    self.parent.repeat_times = self.repeat.text;
    [self.navigationController popViewControllerAnimated:YES];
}
@end
