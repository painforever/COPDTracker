//
//  ConditionReportTableViewController.m
//  COPDTracker
//
//  Created by Yu Song on 10/28/15.
//  Copyright © 2015 EFA. All rights reserved.
//

#import "ConditionReportTableViewController.h"

@interface ConditionReportTableViewController ()
{
    NSMutableArray *table_data;
}
@end

@implementation ConditionReportTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[AFNetwork getAFManager] GET:[SERVER_URL stringByAppendingString:@"patient_reported_conditions"] parameters:@{@"patient_id": [userDefaults valueForKey:@"patient_id"]} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        table_data = (NSMutableArray *)responseObject;
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"failed");
    }];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    return table_data.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ConditionReportCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NSDictionary *dic = [table_data objectAtIndex:indexPath.row];
    cell.date_reported.text = dic[@"date_reported"];
    NSDictionary *condition_description = [NSJSONSerialization JSONObjectWithData:[JSONHandler StringToData:dic[@"condition_description"]] options:NSJSONReadingMutableContainers error:nil];
    NSDictionary *respiration_dic = condition_description[@"respiration"];
    NSDictionary *symptom_dic = condition_description[@"symptom"];
    //respirations
    cell.smoked.text = [NSString stringWithFormat:@"Smoked: %@", respiration_dic[@"smoke_roday"]];
    cell.secondhand_smoke.text = [NSString stringWithFormat:@"Secondhand smoked: %@", respiration_dic[@"secondhand_smoker"]];
    cell.stay_in_pollution.text = [NSString stringWithFormat:@"Stay in pollution: %@", respiration_dic[@"stayin_bad_air"]];
    
    //symptoms
    cell.exertional_breathless.text = [NSString stringWithFormat:@"Exertional Breathless: %@", symptom_dic[@"exertional_breathless"]];
    cell.chronic_cough.text = [NSString stringWithFormat:@"Chronic Cough: %@", symptom_dic[@"chronic_cough"]];
    cell.regular_sputum.text = [NSString stringWithFormat:@"Regular Sputum Production: %@", symptom_dic[@"regular_sputum_production"]];
    cell.frequent_winter_bronchitis.text = [NSString stringWithFormat:@"Frequent Winter Bronchitis: %@", symptom_dic[@"frequent_winter_bronchitis"]];
    cell.wheeze.text = [NSString stringWithFormat:@"Wheeze: %@", symptom_dic[@"wheeze"]];
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addButtonAction:(id)sender {
    self.addConditionReportViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"NewConditionReportTableViewController"];
    [self.navigationController pushViewController:self.addConditionReportViewController animated:YES];
}
@end
