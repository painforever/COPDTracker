//
//  SymptomTableViewController.m
//  COPDTracker
//
//  Created by Yu Song on 10/28/15.
//  Copyright © 2015 EFA. All rights reserved.
//

#import "SymptomTableViewController.h"

@interface SymptomTableViewController ()

@end

@implementation SymptomTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
    return 6;
}

- (IBAction)submitButtonAction:(id)sender {
    self.parent.symptom_hash = @{@"exertional_breathless": [self convertBOOL:self.exertional_breathlessness_switcher], @"chronic_cough": [self convertBOOL:self.chronic_cough_switcher], @"regular_sputum_production": [self convertBOOL:self.regular_sputum_production_switcher], @"frequent_winter_bronchitis": [self convertBOOL:self.frequent_winter_bronchitis_switcher], @"wheeze": [self convertBOOL:self.wheeze_switcher]};
    self.parent.symptom_label.text = @"Done";
    [self.navigationController popViewControllerAnimated:YES];
}
@end
