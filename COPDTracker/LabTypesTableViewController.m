//
//  LabTypesTableViewController.m
//  COPDTracker
//
//  Created by Yu Song on 10/22/15.
//  Copyright © 2015 EFA. All rights reserved.
//

#import "LabTypesTableViewController.h"

@interface LabTypesTableViewController ()

@end

@implementation LabTypesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.labTypes = @[@"Alpha 1 antitrypsin", @"Arterial blood gas test", @"Blood culture", @"Brain natriuretic", @"CBC", @"Cardiac enzyme measurement", @"Chest CT", @"Chest X-ray", @"Electrocardiography", @"Exhaled nitric oxide", @"Metabolic panel", @"Pulse oximetry", @"Sputum culture"];
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
    return self.labTypes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: cellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.textAlignment = NSTextAlignmentLeft;
    cell.textLabel.text = self.labTypes[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.labsForm.labType.text = self.labTypes[indexPath.row];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
