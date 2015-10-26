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
}
@end

@implementation NewAdverseEventTableViewController

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
    datePicker = [[UIDatePicker alloc] init];
    datePicker.datePickerMode = UIDatePickerModeDateAndTime;
    [self.date setInputView:datePicker];
    [datePicker addTarget:self action:@selector(updateTextField:)
         forControlEvents:UIControlEventValueChanged];
}

- (IBAction)submitButtonAction:(id)sender {
}
@end
