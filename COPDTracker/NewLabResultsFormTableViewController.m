//
//  NewLabResultsFormTableViewController.m
//  COPDTracker
//
//  Created by Yu Song on 10/22/15.
//  Copyright © 2015 EFA. All rights reserved.
//

#import "NewLabResultsFormTableViewController.h"

@interface NewLabResultsFormTableViewController ()
{
    UIDatePicker *testDatePicker;
}
@end

@implementation NewLabResultsFormTableViewController

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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"select_lab_type"]) {
        self.typesViewController = (LabTypesTableViewController *)segue.destinationViewController;
        self.typesViewController.labsForm = self;
    }
}


-(void)setUpControls{
    testDatePicker = [[UIDatePicker alloc]init];
    [testDatePicker setDate:[NSDate date]];
    [testDatePicker addTarget:self action:@selector(updateTextField:) forControlEvents:UIControlEventValueChanged];
    [self.testDate setInputView: testDatePicker];
    testDatePicker.datePickerMode = UIDatePickerModeDateAndTime;
}

-(void)updateTextField:(id)sender{
    UIDatePicker *picker = (UIDatePicker*)self.testDate.inputView;
    self.testDate.text = [NSString stringWithFormat:@"%@",picker.date];
}

- (IBAction)save_action:(id)sender {
    if (![self globallyValidateUserInputs:@[self.testDate, self.testResult, self.labType]])
        return;
    [[AFNetwork getAFManager] POST:[SERVER_URL stringByAppendingString:@"labresults"] parameters:@{@"": @""} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    [self showAlert:@"Success" withMessage:@"Lab test result added."];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
